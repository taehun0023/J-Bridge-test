import Link from 'next/link'
import { getCsGovernanceInventory } from '@/app/actions/admin'

function formatCategoryLabel(category: string) {
  return category
    .split('_')
    .map(token => token.charAt(0).toUpperCase() + token.slice(1))
    .join(' ')
}

export default async function CsGovernanceReportPage() {
  const result = await getCsGovernanceInventory()

  if ('error' in result) {
    return (
      <div className="space-y-4">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 dark:text-white">CS Governance Report</h1>
          <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">
            Governed CS inventory and shortage summary.
          </p>
        </div>

        <div className="rounded-xl border border-red-200 bg-red-50 p-4 text-sm text-red-700 dark:border-red-900/40 dark:bg-red-950/30 dark:text-red-300">
          Failed to load inventory: {result.error}
        </div>

        <Link
          href="/admin/reports"
          className="inline-flex items-center rounded-lg border border-gray-300 px-3 py-2 text-sm font-medium text-gray-700 transition hover:bg-gray-50 dark:border-gray-700 dark:text-gray-200 dark:hover:bg-gray-800"
        >
          Back to reports
        </Link>
      </div>
    )
  }

  const { inventory, shortages } = result
  const totalApproved = inventory.reduce((sum, row) => sum + row.approvedTotal, 0)
  const totalUnset = inventory.reduce((sum, row) => sum + row.unsetDifficulty, 0)
  const totalExcluded = inventory.reduce((sum, row) => sum + row.excluded, 0)
  const totalOutOfScope = inventory.reduce((sum, row) => sum + row.outOfScope, 0)
  const totalShortage = shortages.reduce((sum, row) => sum + row.totalShortage, 0)

  return (
    <div className="space-y-8">
      <div className="flex flex-col gap-3 sm:flex-row sm:items-end sm:justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 dark:text-white">CS Governance Report</h1>
          <p className="mt-1 text-sm text-gray-500 dark:text-gray-400">
            Category-by-category governed inventory for the CS comprehensive exam target.
          </p>
        </div>

        <Link
          href="/admin/reports"
          className="inline-flex items-center rounded-lg border border-gray-300 px-3 py-2 text-sm font-medium text-gray-700 transition hover:bg-gray-50 dark:border-gray-700 dark:text-gray-200 dark:hover:bg-gray-800"
        >
          Back to reports
        </Link>
      </div>

      <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-5">
        <div className="rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
          <div className="text-sm text-gray-500 dark:text-gray-400">Approved Total</div>
          <div className="mt-2 text-2xl font-semibold text-gray-900 dark:text-white">{totalApproved}</div>
        </div>
        <div className="rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
          <div className="text-sm text-gray-500 dark:text-gray-400">Total Shortage</div>
          <div className="mt-2 text-2xl font-semibold text-red-600 dark:text-red-400">{totalShortage}</div>
        </div>
        <div className="rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
          <div className="text-sm text-gray-500 dark:text-gray-400">Unset Difficulty</div>
          <div className="mt-2 text-2xl font-semibold text-amber-600 dark:text-amber-400">{totalUnset}</div>
        </div>
        <div className="rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
          <div className="text-sm text-gray-500 dark:text-gray-400">Excluded</div>
          <div className="mt-2 text-2xl font-semibold text-gray-900 dark:text-white">{totalExcluded}</div>
        </div>
        <div className="rounded-xl border border-gray-200 bg-white p-4 dark:border-gray-800 dark:bg-gray-900">
          <div className="text-sm text-gray-500 dark:text-gray-400">Out of Scope</div>
          <div className="mt-2 text-2xl font-semibold text-gray-900 dark:text-white">{totalOutOfScope}</div>
        </div>
      </div>

      <section className="space-y-3">
        <div>
          <h2 className="text-lg font-semibold text-gray-900 dark:text-white">Governed Inventory</h2>
          <p className="text-sm text-gray-500 dark:text-gray-400">
            Approved counts are measured against the comprehensive target pool.
          </p>
        </div>

        <div className="overflow-x-auto rounded-xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-gray-900">
          <table className="min-w-full text-sm">
            <thead className="bg-gray-50 dark:bg-gray-800/70">
              <tr className="text-left text-gray-600 dark:text-gray-300">
                <th className="px-4 py-3 font-medium">Category</th>
                <th className="px-4 py-3 font-medium">Easy</th>
                <th className="px-4 py-3 font-medium">Medium</th>
                <th className="px-4 py-3 font-medium">Hard</th>
                <th className="px-4 py-3 font-medium">Approved</th>
                <th className="px-4 py-3 font-medium">Comprehensive Only</th>
                <th className="px-4 py-3 font-medium">Understanding Only</th>
                <th className="px-4 py-3 font-medium">Unset</th>
                <th className="px-4 py-3 font-medium">Excluded</th>
                <th className="px-4 py-3 font-medium">Out of Scope</th>
              </tr>
            </thead>
            <tbody>
              {inventory.map(row => (
                <tr
                  key={row.category}
                  className="border-t border-gray-200 text-gray-700 dark:border-gray-800 dark:text-gray-200"
                >
                  <td className="px-4 py-3 font-medium text-gray-900 dark:text-white">
                    {formatCategoryLabel(row.category)}
                  </td>
                  <td className="px-4 py-3">{row.approvedEasy}</td>
                  <td className="px-4 py-3">{row.approvedMedium}</td>
                  <td className="px-4 py-3">{row.approvedHard}</td>
                  <td className="px-4 py-3">{row.approvedTotal}</td>
                  <td className="px-4 py-3">{row.comprehensiveOnly}</td>
                  <td className="px-4 py-3">{row.understandingOnly}</td>
                  <td className="px-4 py-3 text-amber-600 dark:text-amber-400">{row.unsetDifficulty}</td>
                  <td className="px-4 py-3">{row.excluded}</td>
                  <td className="px-4 py-3">{row.outOfScope}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </section>

      <section className="space-y-3">
        <div>
          <h2 className="text-lg font-semibold text-gray-900 dark:text-white">Shortage Table</h2>
          <p className="text-sm text-gray-500 dark:text-gray-400">
            Target per category: 9 easy, 15 medium, 6 hard, 30 total.
          </p>
        </div>

        <div className="overflow-x-auto rounded-xl border border-gray-200 bg-white dark:border-gray-800 dark:bg-gray-900">
          <table className="min-w-full text-sm">
            <thead className="bg-gray-50 dark:bg-gray-800/70">
              <tr className="text-left text-gray-600 dark:text-gray-300">
                <th className="px-4 py-3 font-medium">Category</th>
                <th className="px-4 py-3 font-medium">Easy Shortage</th>
                <th className="px-4 py-3 font-medium">Medium Shortage</th>
                <th className="px-4 py-3 font-medium">Hard Shortage</th>
                <th className="px-4 py-3 font-medium">Total Shortage</th>
                <th className="px-4 py-3 font-medium">Unset Difficulty</th>
              </tr>
            </thead>
            <tbody>
              {shortages.map(row => (
                <tr
                  key={row.category}
                  className="border-t border-gray-200 text-gray-700 dark:border-gray-800 dark:text-gray-200"
                >
                  <td className="px-4 py-3 font-medium text-gray-900 dark:text-white">
                    {formatCategoryLabel(row.category)}
                  </td>
                  <td className="px-4 py-3">{row.easyShortage}</td>
                  <td className="px-4 py-3">{row.mediumShortage}</td>
                  <td className="px-4 py-3">{row.hardShortage}</td>
                  <td className="px-4 py-3 text-red-600 dark:text-red-400">{row.totalShortage}</td>
                  <td className="px-4 py-3 text-amber-600 dark:text-amber-400">{row.unsetDifficulty}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </section>
    </div>
  )
}
