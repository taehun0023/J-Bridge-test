# Next.js App Router Routing

> Source: https://nextjs.org/docs/app/building-your-application/routing

## Overview

Next.js uses **file-system based routing** with the `app` directory.

## Pages

```tsx
// app/page.tsx — Route: /
export default function Page() {
  return <h1>Hello Next.js!</h1>
}
```

## Layouts

Shared UI between multiple pages. Preserve state and don't rerender during navigation.

```tsx
// app/layout.tsx — Root Layout (required)
export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body><main>{children}</main></body>
    </html>
  )
}
```

## Nested Routes

```
app/
  blog/
    layout.tsx    // Blog layout
    page.tsx      // /blog
    [slug]/
      page.tsx    // /blog/[slug]
```

## Nesting Layouts

```tsx
// app/blog/layout.tsx
export default function BlogLayout({ children }: { children: React.ReactNode }) {
  return <section>{children}</section>
}
```

Root layout → Blog layout → Blog page

## Dynamic Segments

```tsx
// app/blog/[slug]/page.tsx
export default async function BlogPostPage({
  params,
}: {
  params: Promise<{ slug: string }>
}) {
  const { slug } = await params
  const post = await getPost(slug)
  return <div><h1>{post.title}</h1><p>{post.content}</p></div>
}
```

## Search Parameters

### Server Component

```tsx
export default async function Page({
  searchParams,
}: {
  searchParams: Promise<{ [key: string]: string | string[] | undefined }>
}) {
  const filters = (await searchParams).filters
}
```

Using `searchParams` opts the page into **dynamic rendering**.

### Client Component

```tsx
'use client'
import { useSearchParams } from 'next/navigation'
```

## Linking Between Pages

```tsx
import Link from 'next/link'

<Link href={`/blog/${post.slug}`}>{post.title}</Link>
```

Features: prefetching and client-side navigation.

For programmatic navigation: `useRouter` hook.

## Route Props Helpers

```tsx
// PageProps
export default async function Page(props: PageProps<'/blog/[slug]'>) {
  const { slug } = await props.params
  return <h1>Blog post: {slug}</h1>
}

// LayoutProps
export default function Layout(props: LayoutProps<'/dashboard'>) {
  return <section>{props.children}</section>
}
```

These are globally available, generated during `next dev`, `next build`, or `next typegen`.
