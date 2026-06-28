'use client'

import { useState, useEffect, useCallback } from 'react'
import { createPortal } from 'react-dom'
import { BookOpen } from 'lucide-react'
import AddVocabModal from './AddVocabModal'

export default function VocabContextMenu() {
  const [menu, setMenu] = useState<{ x: number; y: number; text: string } | null>(null)
  const [modal, setModal] = useState<{ term: string; sourceUrl: string } | null>(null)

  const handleContextMenu = useCallback((e: MouseEvent) => {
    const selection = window.getSelection()
    const selectedText = selection?.toString().trim()

    // Only show custom menu when text is selected
    if (!selectedText) return

    e.preventDefault()
    setMenu({ x: e.clientX, y: e.clientY, text: selectedText })
  }, [])

  const handleClick = useCallback(() => {
    setMenu(null)
  }, [])

  const handleKeyDown = useCallback((e: KeyboardEvent) => {
    if (e.key === 'Escape') {
      setMenu(null)
      setModal(null)
    }
  }, [])

  useEffect(() => {
    // document.addEventListener('contextmenu', handleContextMenu)
    document.addEventListener('click', handleClick)
    document.addEventListener('keydown', handleKeyDown)
    return () => {
      // document.removeEventListener('contextmenu', handleContextMenu)
      document.removeEventListener('click', handleClick)
      document.removeEventListener('keydown', handleKeyDown)
    }
  }, [handleContextMenu, handleClick, handleKeyDown])

  function handleAddToVocab() {
    if (!menu) return
    setModal({ term: menu.text, sourceUrl: window.location.pathname })
    setMenu(null)
  }

  return (
    <>
      {menu && createPortal(
        <div
          className="fixed z-[9998] rounded-xl border border-gray-200 bg-white py-1 shadow-lg dark:border-white/[0.08] dark:bg-zinc-800"
          style={{ left: menu.x, top: menu.y }}
        >
          <button
            onClick={handleAddToVocab}
            className="flex w-full items-center gap-2 px-4 py-2 text-left text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700"
          >
            <BookOpen className="h-4 w-4" />
            個人単語帳に追加
          </button>
        </div>,
        document.body
      )}
      {modal && createPortal(
        <AddVocabModal
          initialTerm={modal.term}
          sourceUrl={modal.sourceUrl}
          onClose={() => setModal(null)}
        />,
        document.body
      )}
    </>
  )
}
