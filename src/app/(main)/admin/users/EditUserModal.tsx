'use client'

import { useState } from 'react'
import { useLoadingTransition } from '@/lib/loading-store'
import { ChevronDown } from 'lucide-react'
import { updateUserByAdmin } from '@/app/actions/admin/users'
import { IT_CERTIFICATIONS, parseCertifications, buildCertifications } from '@/lib/certifications'

const JLPT_LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1'] as const

export interface EditableUser {
  id: string
  email: string
  full_name: string | null
  role: string
  mentor_specialty: string | null
  assigned_japanese_mentor_id: string | null
  assigned_tech_mentor_id: string | null
  target_certification: string | null
  jlpt_level: string | null
  it_certifications: string | null
}

interface Mentor {
  id: string
  full_name: string | null
  mentor_specialty: string | null
}

interface NameParts {
  lastName: string
  firstName: string
  katakanaLast: string
  katakanaFirst: string
}

function parseFullName(fullName: string | null): NameParts {
  const empty: NameParts = { lastName: '', firstName: '', katakanaLast: '', katakanaFirst: '' }
  if (!fullName) return empty
  const trimmed = fullName.trim()
  const withKana = trimmed.match(/^(\S+)\s+(\S+)\s*\((\S+)\s+(\S+)\)\s*$/)
  if (withKana) {
    return { lastName: withKana[1], firstName: withKana[2], katakanaLast: withKana[3], katakanaFirst: withKana[4] }
  }
  const twoTokens = trimmed.match(/^(\S+)\s+(\S+)\s*$/)
  if (twoTokens) {
    return { lastName: twoTokens[1], firstName: twoTokens[2], katakanaLast: '', katakanaFirst: '' }
  }
  return { ...empty, lastName: trimmed }
}

function buildFullName(p: NameParts): string {
  const kanji = [p.lastName.trim(), p.firstName.trim()].filter(Boolean).join(' ')
  const katakana = [p.katakanaLast.trim(), p.katakanaFirst.trim()].filter(Boolean).join(' ')
  if (!kanji) return ''
  return katakana ? `${kanji} (${katakana})` : kanji
}

const inputCls =
  'mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-white/5 dark:text-zinc-100'
const selectCls =
  'mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-zinc-800 dark:text-zinc-100'
const labelCls = 'block text-sm font-medium text-zinc-700 dark:text-zinc-300'

export default function EditUserModal({
  user,
  mentors,
  onClose,
  onSaved,
}: {
  user: EditableUser
  mentors: Mentor[]
  onClose: () => void
  onSaved: (msg: string) => void
}) {
  const init = parseFullName(user.full_name)
  const [lastName, setLastName] = useState(init.lastName)
  const [firstName, setFirstName] = useState(init.firstName)
  const [katakanaLast, setKatakanaLast] = useState(init.katakanaLast)
  const [katakanaFirst, setKatakanaFirst] = useState(init.katakanaFirst)
  const [role, setRole] = useState(user.role)
  const [japaneseMentorId, setJapaneseMentorId] = useState(user.assigned_japanese_mentor_id ?? '')
  const [techMentorId, setTechMentorId] = useState(user.assigned_tech_mentor_id ?? '')
  // 전문(専門) 구분 폐지 — 모든 멘토를 일본어·기술 양쪽에 배정 가능
  const japaneseMentors = mentors
  const techMentors = mentors
  const [target, setTarget] = useState(user.target_certification ?? '')
  const [jlpt, setJlpt] = useState(user.jlpt_level ?? '')
  const [selectedCerts, setSelectedCerts] = useState<string[]>(parseCertifications(user.it_certifications))
  const [expandedCategory, setExpandedCategory] = useState<string | null>(null)
  const [newPassword, setNewPassword] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [pending, startTransition] = useLoadingTransition()

  function handleSave() {
    setError(null)
    if (newPassword && newPassword.length < 6) {
      setError('パスワードは6文字以上必要です')
      return
    }
    startTransition(async () => {
      const result = await updateUserByAdmin(user.id, {
        full_name: buildFullName({ lastName, firstName, katakanaLast, katakanaFirst }) || null,
        role,
        mentor_specialty: null,
        japanese_mentor_id: role === 'mentee' ? (japaneseMentorId || null) : null,
        tech_mentor_id: role === 'mentee' ? (techMentorId || null) : null,
        target_certification: target || null,
        jlpt_level: jlpt || null,
        it_certifications: buildCertifications(selectedCerts) || null,
        new_password: newPassword || null,
      })
      if (result.error) setError(result.error)
      else onSaved('プロフィールを更新しました')
    })
  }

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4 backdrop-blur-sm" onClick={onClose}>
      <div
        className="max-h-[90vh] w-full max-w-2xl overflow-y-auto rounded-2xl border border-gray-200/60 bg-white p-6 shadow-xl dark:border-white/[0.08] dark:bg-zinc-900"
        onClick={e => e.stopPropagation()}
      >
        <div className="flex items-center justify-between">
          <h3 className="text-lg font-semibold text-zinc-900 dark:text-zinc-100">プロフィール編集</h3>
          <button onClick={onClose} className="rounded-lg p-1.5 text-zinc-400 hover:bg-zinc-100 dark:hover:bg-white/5" aria-label="閉じる">×</button>
        </div>
        <p className="mt-0.5 text-xs text-zinc-500 dark:text-zinc-400">{user.email}</p>

        <div className="mt-4 space-y-4">
          {/* 名前 */}
          <div>
            <label className={labelCls}>名前（漢字）</label>
            <div className="mt-1 grid grid-cols-2 gap-2">
              <input type="text" value={lastName} onChange={e => setLastName(e.target.value)} placeholder="姓" className={inputCls.replace('mt-1 ', '')} />
              <input type="text" value={firstName} onChange={e => setFirstName(e.target.value)} placeholder="名" className={inputCls.replace('mt-1 ', '')} />
            </div>
          </div>
          <div>
            <label className={labelCls}>カタカナ名</label>
            <div className="mt-1 grid grid-cols-2 gap-2">
              <input type="text" value={katakanaLast} onChange={e => setKatakanaLast(e.target.value)} placeholder="セイ" className={inputCls.replace('mt-1 ', '')} />
              <input type="text" value={katakanaFirst} onChange={e => setKatakanaFirst(e.target.value)} placeholder="メイ" className={inputCls.replace('mt-1 ', '')} />
            </div>
          </div>

          <div className="grid gap-4 sm:grid-cols-2">
            {/* 役割 */}
            <div>
              <label className={labelCls}>役割</label>
              <select value={role} onChange={e => setRole(e.target.value)} className={selectCls}>
                <option value="mentee">メンティー</option>
                <option value="mentor">メンター</option>
                <option value="admin">管理者</option>
              </select>
            </div>

            {/* 担当メンター (mentee, 日本語/技術) / 専門分野 (mentor) */}
            {role === 'mentee' ? (
              <div>
                <label className={labelCls}>担当メンター</label>
                <select value={japaneseMentorId} onChange={e => setJapaneseMentorId(e.target.value)} title="日本語メンター" className={selectCls}>
                  <option value="">日本語: 未指定</option>
                  {japaneseMentors.map(m => (
                    <option key={m.id} value={m.id}>日本語: {m.full_name ?? m.id}</option>
                  ))}
                </select>
                <select value={techMentorId} onChange={e => setTechMentorId(e.target.value)} title="技術メンター" className={selectCls}>
                  <option value="">技術: 未指定</option>
                  {techMentors.map(m => (
                    <option key={m.id} value={m.id}>技術: {m.full_name ?? m.id}</option>
                  ))}
                </select>
              </div>
            ) : (
              <div />
            )}

            {/* 目標資格 */}
            <div>
              <label className={labelCls}>目標資格</label>
              <select value={target} onChange={e => setTarget(e.target.value)} className={selectCls}>
                <option value="">未設定</option>
                {JLPT_LEVELS.map(l => <option key={l} value={l}>{l}</option>)}
              </select>
            </div>

            {/* JLPT */}
            <div>
              <label className={labelCls}>日本語資格 (JLPT)</label>
              <select value={jlpt} onChange={e => setJlpt(e.target.value)} className={selectCls}>
                <option value="">なし</option>
                {JLPT_LEVELS.map(l => <option key={l} value={l}>{l}</option>)}
              </select>
            </div>
          </div>

          {/* IT関連資格 */}
          <div>
            <div className="flex items-baseline justify-between">
              <label className={labelCls}>IT関連資格</label>
              <span className="text-xs text-zinc-500 dark:text-zinc-400">選択中 <span className="font-semibold text-indigo-600 dark:text-indigo-300">{selectedCerts.length}</span> 件</span>
            </div>
            <div className="mt-2 space-y-2">
              {Object.entries(IT_CERTIFICATIONS).map(([category, items]) => {
                const selectedInCat = items.filter(item => selectedCerts.includes(item)).length
                const isOpen = expandedCategory === category
                const hasSelection = selectedInCat > 0
                return (
                  <div key={category} className={`overflow-hidden rounded-2xl ring-1 transition-colors ${hasSelection ? 'bg-indigo-50/40 ring-indigo-200 dark:bg-indigo-500/5 dark:ring-indigo-500/30' : 'bg-white ring-gray-200 dark:bg-white/[0.02] dark:ring-white/[0.08]'}`}>
                    <button type="button" onClick={() => setExpandedCategory(isOpen ? null : category)} aria-expanded={isOpen} className="flex w-full items-center justify-between px-4 py-2.5 text-left transition-colors hover:bg-zinc-50/60 dark:hover:bg-white/[0.04]">
                      <div className="flex items-center gap-2.5">
                        <span className={`inline-flex h-6 min-w-6 items-center justify-center rounded-full px-2 text-xs font-semibold ${hasSelection ? 'bg-indigo-600 text-white dark:bg-indigo-500' : 'bg-zinc-100 text-zinc-500 dark:bg-white/[0.08] dark:text-zinc-400'}`}>{selectedInCat}</span>
                        <span className="text-sm font-medium text-zinc-800 dark:text-zinc-100">{category}</span>
                        <span className="text-xs text-zinc-400 dark:text-zinc-500">全{items.length}件</span>
                      </div>
                      <ChevronDown className={`h-4 w-4 text-zinc-400 transition-transform dark:text-zinc-500 ${isOpen ? 'rotate-180' : ''}`} aria-hidden />
                    </button>
                    {isOpen && (
                      <div className="border-t border-zinc-200/70 px-4 py-3 dark:border-white/[0.06]">
                        <div className="flex flex-wrap gap-2">
                          {items.map(item => {
                            const active = selectedCerts.includes(item)
                            return (
                              <button key={item} type="button"
                                onClick={() => setSelectedCerts(prev => active ? prev.filter(c => c !== item) : [...prev, item])}
                                aria-pressed={active}
                                className={`inline-flex items-center gap-1 rounded-full px-3 py-1.5 text-xs font-medium ring-1 transition-colors ${active ? 'bg-indigo-600 text-white ring-indigo-600 hover:bg-indigo-500 dark:bg-indigo-500 dark:ring-indigo-500' : 'bg-white text-zinc-700 ring-gray-200 hover:bg-indigo-50 hover:text-indigo-700 hover:ring-indigo-200 dark:bg-white/[0.04] dark:text-zinc-300 dark:ring-white/[0.08] dark:hover:bg-indigo-500/10 dark:hover:text-indigo-300 dark:hover:ring-indigo-500/30'}`}>
                                <span className={`inline-block h-2 w-2 rounded-full ${active ? 'bg-white' : 'bg-zinc-300 dark:bg-white/20'}`} aria-hidden />
                                {item}
                              </button>
                            )
                          })}
                        </div>
                      </div>
                    )}
                  </div>
                )
              })}
            </div>
          </div>

          {/* パスワード初期化 */}
          <div>
            <label className={labelCls}>パスワード初期化 <span className="text-xs font-normal text-zinc-400">（変更する場合のみ入力 / 6文字以上）</span></label>
            <input type="password" value={newPassword} onChange={e => setNewPassword(e.target.value)} placeholder="新しいパスワード" autoComplete="new-password" className={inputCls} />
          </div>

          {error && (
            <div className="rounded-xl bg-red-500/10 px-3 py-2 text-sm text-red-500 ring-1 ring-red-500/20">{error}</div>
          )}
        </div>

        <div className="mt-6 flex justify-end gap-2 border-t border-gray-200 pt-4 dark:border-white/[0.08]">
          <button type="button" onClick={onClose} disabled={pending} className="rounded-xl px-4 py-2 text-sm font-medium text-zinc-700 hover:bg-zinc-100 dark:text-zinc-300 dark:hover:bg-white/5">キャンセル</button>
          <button type="button" onClick={handleSave} disabled={pending} className="rounded-xl bg-indigo-600 px-5 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50">{pending ? '保存中...' : '保存'}</button>
        </div>
      </div>
    </div>
  )
}
