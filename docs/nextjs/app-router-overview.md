# Next.js App Router Overview

> Source: https://nextjs.org/docs/app/getting-started

## Overview

Next.js uses **file-system based routing**, where folders and files define routes in the `app` directory.

## Prerequisites
- HTML, CSS, JavaScript, React

## Core Topics

1. **Installation** - Create a new app with `create-next-app` CLI
2. **Project Structure** - Folder and file conventions
3. **Layouts and Pages** - Creating pages and layouts with Link component
4. **Linking and Navigating** - Prefetching, prerendering, client-side navigation
5. **Server and Client Components** - React Server and Client Components
6. **Fetching Data** - Data fetching and content streaming
7. **Updating Data** - Server Functions and Server Actions
8. **Error Handling** - Displaying and handling errors
9. **CSS** - Tailwind, CSS Modules, Global CSS
10. **Route Handlers** - API endpoints

## Creating a Page

```tsx
// app/page.tsx
export default function Page() {
  return <h1>Hello Next.js!</h1>
}
```

## Creating a Layout

```tsx
// app/layout.tsx
export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>
        <main>{children}</main>
      </body>
    </html>
  )
}
```

**Root Layout**: Required at the root of `app` directory, must contain `html` and `body` tags.

## Nested Routes

```
app/
  blog/
    page.tsx         // /blog
    [slug]/
      page.tsx       // /blog/[slug]
```

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
  return <div><h1>{post.title}</h1></div>
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

## Linking

```tsx
import Link from 'next/link'

<Link href={`/blog/${post.slug}`}>{post.title}</Link>
```

## Route Props Helpers

```tsx
// PageProps
export default async function Page(props: PageProps<'/blog/[slug]'>) {
  const { slug } = await props.params
}

// LayoutProps
export default function Layout(props: LayoutProps<'/dashboard'>) {
  return <section>{props.children}</section>
}
```
