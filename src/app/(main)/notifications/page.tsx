import NotificationsClient from './NotificationsClient'
import { getNotifications } from '@/app/actions/notifications'

export default async function NotificationsPage() {
  const { notifications } = await getNotifications(100)
  return (
    <div>
      <h1 className="text-2xl font-bold text-gray-900 dark:text-white">通知</h1>
      <NotificationsClient initial={notifications} />
    </div>
  )
}
