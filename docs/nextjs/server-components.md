# Next.js Server Components

> Source: https://nextjs.org/docs/app/building-your-application/rendering/server-components

## Overview

By default, layouts and pages are **Server Components**. Use **Client Components** when you need interactivity or browser APIs.

## When to Use

### Server Components
- Fetch data from databases/APIs close to the source
- Use API keys/tokens without exposing to client
- Reduce JavaScript sent to browser
- Improve FCP and stream content progressively

### Client Components
- State and event handlers (`onClick`, `onChange`)
- Lifecycle logic (`useEffect`)
- Browser-only APIs (`localStorage`, `window`)
- Custom hooks

## How It Works

### On the Server
- Server Components → React Server Component Payload (RSC Payload)
- Client Components + RSC Payload → pre-rendered HTML

### On the Client (First Load)
1. HTML → fast non-interactive preview
2. RSC Payload → reconcile Client and Server Component trees
3. JavaScript → hydrate Client Components

## Creating Client Components

```tsx
'use client'

import { useState } from 'react'

export default function Counter() {
  const [count, setCount] = useState(0)
  return (
    <div>
      <p>{count} likes</p>
      <button onClick={() => setCount(count + 1)}>Click me</button>
    </div>
  )
}
```

## Reducing JS Bundle Size

Add `'use client'` only to specific interactive components:

```tsx
import Search from './search'  // Client Component
import Logo from './logo'      // Server Component

export default function Layout({ children }) {
  return (
    <>
      <nav><Logo /><Search /></nav>
      <main>{children}</main>
    </>
  )
}
```

## Passing Data from Server to Client

```tsx
// Server Component
import LikeButton from '@/app/ui/like-button'

export default async function Page({ params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const post = await getPost(id)
  return <LikeButton likes={post.likes} />
}
```

Props must be **serializable** by React.

## Interleaving Components

Pass Server Components as `children` to Client Components:

```tsx
// Client Component
'use client'
export default function Modal({ children }: { children: React.ReactNode }) {
  return <div>{children}</div>
}

// Server Component
import Modal from './ui/modal'
import Cart from './ui/cart'  // Server Component

export default function Page() {
  return <Modal><Cart /></Modal>
}
```

## Context Providers

```tsx
// app/theme-provider.tsx
'use client'
import { createContext } from 'react'

export const ThemeContext = createContext({})

export default function ThemeProvider({ children }: { children: React.ReactNode }) {
  return <ThemeContext.Provider value="dark">{children}</ThemeContext.Provider>
}
```

```tsx
// app/layout.tsx (Server Component)
import ThemeProvider from './theme-provider'

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html><body><ThemeProvider>{children}</ThemeProvider></body></html>
  )
}
```

## Third-Party Components

Wrap client-only third-party components:

```tsx
'use client'
import { Carousel } from 'acme-carousel'
export default Carousel
```

## Preventing Environment Poisoning

```ts
import 'server-only'

export async function getData() {
  const res = await fetch('https://external-service.com/data', {
    headers: { authorization: process.env.API_KEY },
  })
  return res.json()
}
```

Install: `npm install server-only`
