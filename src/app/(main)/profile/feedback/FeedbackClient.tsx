'use client'

import { useState, useTransition } from 'react'
import Card from '@/components/ui/Card'
import { createFeedback, updateFeedback, deleteFeedback } from '@/app/actions/admin/feedback'
import { createFeedbackReply, updateFeedbackReply, deleteFeedbackReply, bulkDeleteFeedbacks } from '@/app/actions/feedback'
import NameRuby from '@/components/ui/NameRuby'
import NameSelect from '@/components/ui/NameSelect'

const categoryLabels: Record<string, string> = {
  seikatsu: 'JLPT',
  business_jp: 'ビジネス日本語',
  cs: 'CS知識',
  dev: '開発実務能力',
  business_lit: 'ビジネスリテラシー',
}

const categoryColors: Record<string, string> = {
  seikatsu: 'bg-blue-500/10 text-blue-400 ring-blue-500/20',
  business_jp: 'bg-purple-500/10 text-purple-400 ring-purple-500/20',
  cs: 'bg-cyan-500/10 text-cyan-400 ring-cyan-500/20',
  dev: 'bg-emerald-500/10 text-emerald-400 ring-emerald-500/20',
  business_lit: 'bg-amber-500/10 text-amber-400 ring-amber-500/20',
}

interface Reply {
  id: string
  user_id: string
  content: string
  created_at: string
  updated_at: string
  user: { full_name: string | null } | null
}

interface FeedbackItem {
  id: string
  category: string
  content: string
  created_at: string
  admin: { id: string; full_name: string | null } | null
  user: { id: string; full_name: string | null } | null
  feedback_replies: Reply[]
}

interface FeedbackTargetUser {
  id: string
  full_name: string | null
  email: string
}

interface Props {
  feedbacks: FeedbackItem[]
  currentUserId: string
  userRole: string
  feedbackTargetUsers: FeedbackTargetUser[]
}

export default function FeedbackClient({ feedbacks, currentUserId, userRole, feedbackTargetUsers }: Props) {
  const canBulkDelete = userRole === 'admin'
  const canCreate = userRole === 'admin' || userRole === 'mentor'
  const [message, setMessage] = useState<string | null>(null)
  const [pending, startTransition] = useTransition()
  const [showCreateForm, setShowCreateForm] = useState(false)
  const [targetUserId, setTargetUserId] = useState('')

  function showMessage(msg: string) {
    setMessage(msg)
    setTimeout(() => setMessage(null), 3000)
  }

  function handleBulkDelete() {
    if (!confirm('すべてのフィードバックを削除しますか？この操作は元に戻せません。')) return
    startTransition(async () => {
      const result = await bulkDeleteFeedbacks()
      if (result.error) showMessage(result.error)
      else showMessage('フィードバックを一括削除しました')
    })
  }

  function handleCreateFeedback(formData: FormData) {
    startTransition(async () => {
      try {
        const result = await createFeedback(formData)
        if ('error' in result) showMessage(result.error ?? 'エラーが発生しました')
        else {
          showMessage('フィードバックが登録されました')
          setShowCreateForm(false)
        }
      } catch (e) {
        console.error('[handleCreateFeedback] Error:', e)
        showMessage('フィードバック登録中にエラーが発生しました')
      }
    })
  }

  return (
    <div>
      {message && (
        <div className="mb-4 rounded-xl bg-indigo-500/10 px-4 py-3 text-sm text-indigo-400 ring-1 ring-indigo-500/20">
          {message}
        </div>
      )}

      {/* Create feedback form (admin/mentor) */}
      {canCreate && feedbackTargetUsers.length > 0 && (
        <div className="mb-6">
          {!showCreateForm ? (
            <button
              onClick={() => setShowCreateForm(true)}
              className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 transition-colors"
            >
              + フィードバック作成
            </button>
          ) : (
            <Card>
              <h3 className="mb-4 text-sm font-semibold text-zinc-900 dark:text-white">フィードバック作成</h3>
              <form action={handleCreateFeedback} className="space-y-4">
                <div>
                  <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">対象ユーザー *</label>
                  <div className="mt-1">
                    <NameSelect
                      name="user_id"
                      required
                      value={targetUserId}
                      onChange={setTargetUserId}
                      options={feedbackTargetUsers}
                      placeholder="ユーザーを選択..."
                    />
                  </div>
                </div>
                <div>
                  <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">カテゴリ</label>
                  <select
                    name="category"
                    className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-gray-700 dark:text-white"
                  >
                    {Object.entries(categoryLabels).map(([key, label]) => (
                      <option key={key} value={key}>{label}</option>
                    ))}
                  </select>
                </div>
                <div>
                  <label className="block text-sm font-medium text-zinc-700 dark:text-zinc-300">内容 *</label>
                  <textarea
                    name="content"
                    required
                    rows={3}
                    className="mt-1 w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-gray-700 dark:text-white"
                  />
                </div>
                <div className="flex gap-2">
                  <button
                    type="submit"
                    disabled={pending}
                    className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
                  >
                    {pending ? '登録中...' : '登録'}
                  </button>
                  <button
                    type="button"
                    onClick={() => setShowCreateForm(false)}
                    className="rounded-xl border border-gray-200 dark:border-white/[0.08] px-4 py-2 text-sm font-medium text-zinc-400 hover:bg-zinc-50 dark:hover:bg-white/5 transition-colors"
                  >
                    キャンセル
                  </button>
                </div>
              </form>
            </Card>
          )}
        </div>
      )}

      {/* Bulk delete button */}
      {canBulkDelete && feedbacks.length > 0 && (
        <div className="mb-4 flex justify-end">
          <button
            onClick={handleBulkDelete}
            disabled={pending}
            className="rounded-xl border border-red-500/20 px-4 py-2 text-sm font-medium text-red-400 hover:bg-red-500/10 disabled:opacity-50 transition-colors"
          >
            一括削除
          </button>
        </div>
      )}

      {/* Feedback list */}
      <div className="space-y-4">
        {feedbacks.length === 0 ? (
          <Card>
            <p className="py-8 text-center text-sm text-zinc-500">
              フィードバックはありません
            </p>
          </Card>
        ) : (
          feedbacks.map((fb) => (
            <FeedbackCard
              key={fb.id}
              feedback={fb}
              currentUserId={currentUserId}
              userRole={userRole}
              pending={pending}
              startTransition={startTransition}
              showMessage={showMessage}
            />
          ))
        )}
      </div>

      <p className="mt-6 text-center text-xs text-zinc-400">
        ※ DBデータ蓄積を防ぐため、1ヶ月経過したフィードバックは自動的に削除されます。
      </p>
    </div>
  )
}

function FeedbackCard({
  feedback,
  currentUserId,
  userRole,
  pending,
  startTransition,
  showMessage,
}: {
  feedback: FeedbackItem
  currentUserId: string
  userRole: string
  pending: boolean
  startTransition: (cb: () => void) => void
  showMessage: (msg: string) => void
}) {
  const [showReplies, setShowReplies] = useState(false)
  const [replyText, setReplyText] = useState('')
  const [editingFeedback, setEditingFeedback] = useState(false)
  const [editFeedbackText, setEditFeedbackText] = useState(feedback.content)
  const [editingReplyId, setEditingReplyId] = useState<string | null>(null)
  const [editReplyText, setEditReplyText] = useState('')

  const senderName = feedback.admin?.full_name ?? null
  const receiverName = feedback.user?.full_name ?? null
  const isFeedbackAuthor = feedback.admin?.id === currentUserId
  const isAdmin = userRole === 'admin'
  const replyCount = feedback.feedback_replies?.length ?? 0

  function handleUpdateFeedback() {
    startTransition(async () => {
      const result = await updateFeedback(feedback.id, editFeedbackText)
      if (result.error) showMessage(result.error)
      else {
        showMessage('フィードバックを更新しました')
        setEditingFeedback(false)
      }
    })
  }

  function handleDeleteFeedback() {
    if (!confirm('このフィードバックを削除しますか？')) return
    startTransition(async () => {
      const result = await deleteFeedback(feedback.id)
      if (result.error) showMessage(result.error)
      else showMessage('フィードバックを削除しました')
    })
  }

  function handleReply() {
    if (!replyText.trim()) return
    startTransition(async () => {
      const result = await createFeedbackReply(feedback.id, replyText)
      if (result.error) showMessage(result.error)
      else {
        showMessage('返信を送信しました')
        setReplyText('')
      }
    })
  }

  function handleUpdateReply(replyId: string) {
    startTransition(async () => {
      const result = await updateFeedbackReply(replyId, editReplyText)
      if (result.error) showMessage(result.error)
      else {
        showMessage('返信を更新しました')
        setEditingReplyId(null)
      }
    })
  }

  function handleDeleteReply(replyId: string) {
    if (!confirm('この返信を削除しますか？')) return
    startTransition(async () => {
      const result = await deleteFeedbackReply(replyId)
      if (result.error) showMessage(result.error)
      else showMessage('返信を削除しました')
    })
  }

  return (
    <Card>
      <div className="flex items-start justify-between gap-3">
        <div className="flex items-center gap-2 flex-wrap">
          <span className={`inline-flex rounded-full px-2 py-0.5 text-xs font-medium ring-1 ${categoryColors[feedback.category] ?? 'bg-zinc-500/10 text-zinc-400 ring-zinc-500/20'}`}>
            {categoryLabels[feedback.category] ?? feedback.category}
          </span>
          <span className="text-xs text-zinc-500 dark:text-zinc-400">
            From: <NameRuby name={senderName} fallback="不明" /> → <NameRuby name={receiverName} fallback="不明" />
          </span>
          <span className="text-xs text-zinc-500 dark:text-zinc-400">
            {new Date(feedback.created_at).toLocaleDateString('ja-JP')}
          </span>
        </div>
        {(isFeedbackAuthor || isAdmin) && (
          <div className="flex gap-1 shrink-0">
            {isFeedbackAuthor && (
              <button
                onClick={() => { setEditingFeedback(true); setEditFeedbackText(feedback.content) }}
                className="rounded-lg px-2 py-1 text-xs text-zinc-400 hover:bg-white/5 dark:hover:bg-white/5 hover:bg-zinc-50 transition-colors"
              >
                編集
              </button>
            )}
            <button
              onClick={handleDeleteFeedback}
              disabled={pending}
              className="rounded-lg px-2 py-1 text-xs text-red-400 hover:bg-red-500/10 transition-colors disabled:opacity-50"
            >
              削除
            </button>
          </div>
        )}
      </div>

      {/* Feedback content */}
      {editingFeedback ? (
        <div className="mt-3">
          <textarea
            value={editFeedbackText}
            onChange={(e) => setEditFeedbackText(e.target.value)}
            rows={3}
            className="w-full rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-gray-700 dark:text-white"
          />
          <div className="mt-2 flex gap-2">
            <button
              onClick={handleUpdateFeedback}
              disabled={pending}
              className="rounded-lg bg-indigo-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
            >
              保存
            </button>
            <button
              onClick={() => setEditingFeedback(false)}
              className="rounded-lg border border-gray-200 dark:border-white/[0.08] px-3 py-1.5 text-xs font-medium text-zinc-400 hover:bg-white/5 dark:hover:bg-white/5 hover:bg-zinc-50 transition-colors"
            >
              キャンセル
            </button>
          </div>
        </div>
      ) : (
        <p className="mt-3 text-sm text-zinc-700 dark:text-zinc-300 whitespace-pre-wrap">{feedback.content}</p>
      )}

      {/* Replies toggle */}
      <div className="mt-3 border-t border-gray-100 dark:border-white/[0.06] pt-3">
        <button
          onClick={() => setShowReplies(!showReplies)}
          className="text-xs font-medium text-indigo-500 hover:text-indigo-400 transition-colors"
        >
          {showReplies ? '返信を閉じる' : `返信 (${replyCount})`}
        </button>
      </div>

      {/* Replies list */}
      {showReplies && (
        <div className="mt-3 space-y-3">
          {feedback.feedback_replies?.map((reply) => (
            <div key={reply.id} className="rounded-xl bg-gray-50 dark:bg-white/[0.03] p-3">
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <span className="text-xs font-medium text-zinc-700 dark:text-zinc-300">
                    <NameRuby name={reply.user?.full_name} fallback="ユーザー" />
                  </span>
                  <span className="text-xs text-zinc-500 dark:text-zinc-400">
                    {new Date(reply.created_at).toLocaleDateString('ja-JP')}
                  </span>
                </div>
                {reply.user_id === currentUserId && (
                  <div className="flex gap-1">
                    <button
                      onClick={() => { setEditingReplyId(reply.id); setEditReplyText(reply.content) }}
                      className="rounded px-1.5 py-0.5 text-xs text-zinc-400 hover:bg-white/5 dark:hover:bg-white/5 hover:bg-zinc-100 transition-colors"
                    >
                      編集
                    </button>
                    <button
                      onClick={() => handleDeleteReply(reply.id)}
                      disabled={pending}
                      className="rounded px-1.5 py-0.5 text-xs text-red-400 hover:bg-red-500/10 transition-colors disabled:opacity-50"
                    >
                      削除
                    </button>
                  </div>
                )}
              </div>
              {editingReplyId === reply.id ? (
                <div className="mt-2">
                  <textarea
                    value={editReplyText}
                    onChange={(e) => setEditReplyText(e.target.value)}
                    rows={2}
                    className="w-full rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-gray-700 dark:text-white"
                  />
                  <div className="mt-2 flex gap-2">
                    <button
                      onClick={() => handleUpdateReply(reply.id)}
                      disabled={pending}
                      className="rounded-lg bg-indigo-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
                    >
                      保存
                    </button>
                    <button
                      onClick={() => setEditingReplyId(null)}
                      className="rounded-lg border border-gray-200 dark:border-white/[0.08] px-3 py-1.5 text-xs font-medium text-zinc-400 hover:bg-white/5 dark:hover:bg-white/5 hover:bg-zinc-50 transition-colors"
                    >
                      キャンセル
                    </button>
                  </div>
                </div>
              ) : (
                <p className="mt-1 text-sm text-zinc-600 dark:text-zinc-400 whitespace-pre-wrap">{reply.content}</p>
              )}
            </div>
          ))}

          {/* Reply form */}
          <div className="flex gap-2">
            <textarea
              value={replyText}
              onChange={(e) => setReplyText(e.target.value)}
              placeholder="返信を入力..."
              rows={2}
              className="flex-1 rounded-xl border border-gray-200 bg-white px-3 py-2 text-sm text-zinc-900 focus:border-indigo-500 focus:outline-none dark:border-white/[0.08] dark:bg-gray-700 dark:text-white"
            />
            <button
              onClick={handleReply}
              disabled={pending || !replyText.trim()}
              className="self-end rounded-xl bg-indigo-600 px-4 py-2 text-sm font-medium text-white hover:bg-indigo-500 disabled:opacity-50 transition-colors"
            >
              送信
            </button>
          </div>
        </div>
      )}
    </Card>
  )
}
