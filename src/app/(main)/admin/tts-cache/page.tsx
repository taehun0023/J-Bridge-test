import TtsCacheClient from './TtsCacheClient'

export default function TtsCachePage() {
  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">TTS キャッシュ管理</h1>
      <p className="mt-1 text-gray-500 dark:text-gray-400">
        音声データを事前生成してSupabase Storageにキャッシュします
      </p>
      <TtsCacheClient />
    </div>
  )
}
