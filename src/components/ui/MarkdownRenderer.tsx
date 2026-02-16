'use client'

import type { Components } from 'react-markdown'
import ReactMarkdown from 'react-markdown'
import remarkGfm from 'remark-gfm'
import rehypeHighlight from 'rehype-highlight'

interface MarkdownRendererProps {
  content: string
}

const mdComponents: Components = {
  h2: ({ children }) => (
    <h2 className="mt-10 mb-4 pb-2 border-b border-gray-200 dark:border-gray-700 text-xl font-bold text-gray-900 dark:text-gray-100">
      {children}
    </h2>
  ),
  h3: ({ children }) => (
    <h3 className="mt-6 mb-3 text-lg font-semibold text-gray-900 dark:text-gray-100">
      {children}
    </h3>
  ),
  h4: ({ children }) => (
    <h4 className="mt-4 mb-2 text-base font-semibold text-gray-900 dark:text-gray-100">
      {children}
    </h4>
  ),
  p: ({ children }) => (
    <p className="my-3 leading-7 text-gray-700 dark:text-gray-300">{children}</p>
  ),
  table: ({ children }) => (
    <div className="my-4 overflow-x-auto rounded-lg border border-gray-200 dark:border-gray-700">
      <table className="min-w-full divide-y divide-gray-200 dark:divide-gray-700 text-sm">
        {children}
      </table>
    </div>
  ),
  thead: ({ children }) => (
    <thead className="bg-gray-50 dark:bg-gray-800">{children}</thead>
  ),
  th: ({ children }) => (
    <th className="px-4 py-2.5 text-left font-semibold text-gray-700 dark:text-gray-300">
      {children}
    </th>
  ),
  td: ({ children }) => (
    <td className="px-4 py-2.5 text-gray-700 dark:text-gray-300 border-t border-gray-100 dark:border-gray-800">
      {children}
    </td>
  ),
  pre: ({ children }) => (
    <pre className="my-4 overflow-x-auto rounded-xl bg-gray-900 p-4 text-sm leading-6">
      {children}
    </pre>
  ),
  code: ({ children, className }) => {
    // className is set by rehype-highlight for code blocks (e.g. "language-java hljs")
    if (className) {
      return <code className={className}>{children}</code>
    }
    // Inline code
    return (
      <code className="rounded bg-gray-100 dark:bg-gray-800 px-1.5 py-0.5 text-sm text-pink-600 dark:text-pink-400">
        {children}
      </code>
    )
  },
  ul: ({ children }) => (
    <ul className="my-3 ml-6 list-disc space-y-1.5 text-gray-700 dark:text-gray-300 marker:text-gray-400">
      {children}
    </ul>
  ),
  ol: ({ children }) => (
    <ol className="my-3 ml-6 list-decimal space-y-1.5 text-gray-700 dark:text-gray-300 marker:text-gray-400">
      {children}
    </ol>
  ),
  li: ({ children }) => (
    <li className="pl-1 leading-7">{children}</li>
  ),
  blockquote: ({ children }) => (
    <blockquote className="my-4 border-l-4 border-indigo-400 bg-indigo-50 dark:bg-indigo-950/30 pl-4 py-2 text-gray-700 dark:text-gray-300 italic">
      {children}
    </blockquote>
  ),
  a: ({ children, href }) => (
    <a href={href} className="text-indigo-600 dark:text-indigo-400 underline hover:text-indigo-500" target="_blank" rel="noopener noreferrer">
      {children}
    </a>
  ),
  hr: () => <hr className="my-8 border-gray-200 dark:border-gray-700" />,
  img: ({ src, alt }) => (
    // eslint-disable-next-line @next/next/no-img-element
    <img src={src} alt={alt ?? ''} className="my-4 rounded-lg max-w-full" />
  ),
  input: ({ checked, disabled: _disabled, type, ...rest }) => {
    if (type === 'checkbox') {
      return (
        <input
          type="checkbox"
          defaultChecked={!!checked}
          className="mr-2 h-4 w-4 cursor-pointer rounded border-gray-300 text-indigo-600 accent-indigo-600"
          {...rest}
        />
      )
    }
    return <input type={type} checked={checked} {...rest} />
  },
  strong: ({ children }) => (
    <strong className="font-semibold text-gray-900 dark:text-gray-100">{children}</strong>
  ),
}

export default function MarkdownRenderer({ content }: MarkdownRendererProps) {
  // Strip MDX frontmatter and internal evidence tags
  const body = content
    .replace(/^---[\s\S]*?---\n*/, '')
    .replace(/\s*\(Evidence:\s*E[\d,\s E]+\)/g, '')

  return (
    <div className="max-w-none">
      <ReactMarkdown
        remarkPlugins={[remarkGfm]}
        rehypePlugins={[rehypeHighlight]}
        components={mdComponents}
      >
        {body}
      </ReactMarkdown>
    </div>
  )
}
