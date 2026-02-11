'use client'

import { useState, useRef } from 'react'
import { uploadAvatar, removeAvatar } from '@/app/actions/profile'
import { useRouter } from 'next/navigation'

interface ProfileAvatarProps {
  avatarUrl: string | null
  userName: string | null
  size?: 'sm' | 'md' | 'lg'
}

export default function ProfileAvatar({ avatarUrl, userName, size = 'md' }: ProfileAvatarProps) {
  const [isOpen, setIsOpen] = useState(false)
  const [uploading, setUploading] = useState(false)
  const fileInputRef = useRef<HTMLInputElement>(null)
  const router = useRouter()

  const sizeClasses = {
    sm: 'h-8 w-8',
    md: 'h-10 w-10',
    lg: 'h-12 w-12',
  }

  const handleFileSelect = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return

    setUploading(true)
    const formData = new FormData()
    formData.append('avatar', file)

    const result = await uploadAvatar(formData)
    if (result.success) {
      router.refresh()
    } else {
      alert(result.error || 'アップロード失敗')
    }
    setUploading(false)
    setIsOpen(false)
  }

  const handleRemove = async () => {
    if (!confirm('プロフィール画像を削除しますか？')) return

    const result = await removeAvatar()
    if (result.success) {
      router.refresh()
    } else {
      alert(result.error || '削除失敗')
    }
    setIsOpen(false)
  }

  const initials = userName
    ?.split(' ')
    .map((n) => n[0])
    .join('')
    .toUpperCase()
    .slice(0, 2) || 'U'

  return (
    <div className="relative">
      <button
        onClick={() => setIsOpen(!isOpen)}
        className={`${sizeClasses[size]} relative flex items-center justify-center rounded-full overflow-hidden border-2 border-gray-200 dark:border-white/[0.08] hover:border-indigo-500/50 dark:hover:border-indigo-500/50 transition-colors`}
        aria-label="プロフィール画像設定"
      >
        {avatarUrl ? (
          <img src={avatarUrl} alt={userName || 'プロフィール'} className="h-full w-full object-cover" />
        ) : (
          <div className="flex h-full w-full items-center justify-center bg-indigo-600 text-white font-medium text-sm">
            {initials}
          </div>
        )}
        {uploading && (
          <div className="absolute inset-0 flex items-center justify-center bg-black bg-opacity-50">
            <div className="h-4 w-4 animate-spin rounded-full border-2 border-white border-t-transparent" />
          </div>
        )}
      </button>

      {isOpen && (
        <>
          <div
            className="fixed inset-0 z-40"
            onClick={() => setIsOpen(false)}
          />
          <div className="absolute right-0 top-12 z-50 w-48 rounded-2xl border border-gray-200 bg-white shadow-lg dark:border-white/[0.08] dark:bg-zinc-900/90 dark:backdrop-blur-xl">
            <div className="py-1">
              <button
                onClick={() => fileInputRef.current?.click()}
                className="w-full px-4 py-2 text-left text-sm text-zinc-700 hover:bg-zinc-50 dark:text-zinc-300 dark:hover:bg-white/5"
                disabled={uploading}
              >
                {uploading ? 'アップロード中...' : '画像変更'}
              </button>
              {avatarUrl && (
                <button
                  onClick={handleRemove}
                  className="w-full px-4 py-2 text-left text-sm text-red-500 hover:bg-zinc-50 dark:text-red-400 dark:hover:bg-white/5"
                >
                  画像削除
                </button>
              )}
            </div>
          </div>
        </>
      )}

      <input
        ref={fileInputRef}
        type="file"
        accept="image/*"
        className="hidden"
        onChange={handleFileSelect}
      />
    </div>
  )
}
