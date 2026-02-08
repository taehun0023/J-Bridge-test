# Next.js Server Actions and Mutations

> Source: https://nextjs.org/docs/app/building-your-application/data-fetching/server-actions-and-mutations

## Overview

**Server Functions** are async functions that run on the server and can be called from the client. When used for form submissions/mutations, they're called **Server Actions**.

- Must be async functions
- Use POST HTTP method exclusively
- Integrate with Next.js caching architecture

## Creating Server Functions

### File-level directive

```ts
// app/lib/actions.ts
'use server'

export async function createPost(formData: FormData) {
  const title = formData.get('title')
  const content = formData.get('content')
  // Update data, revalidate cache
}
```

### Inline in Server Components

```tsx
export default function Page() {
  async function createPost(formData: FormData) {
    'use server'
    // ...
  }
  return <></>
}
```

### Import in Client Components

```tsx
'use client'
import { createPost } from '@/app/actions'

export function Button() {
  return <button formAction={createPost}>Create</button>
}
```

## Invoking Server Functions

### Forms

```tsx
import { createPost } from '@/app/actions'

export function Form() {
  return (
    <form action={createPost}>
      <input type="text" name="title" />
      <button type="submit">Create</button>
    </form>
  )
}
```

### Event Handlers

```tsx
'use client'
import { incrementLike } from './actions'
import { useState } from 'react'

export default function LikeButton({ initialLikes }: { initialLikes: number }) {
  const [likes, setLikes] = useState(initialLikes)
  return (
    <button onClick={async () => {
      const updatedLikes = await incrementLike()
      setLikes(updatedLikes)
    }}>
      Like ({likes})
    </button>
  )
}
```

### useEffect

```tsx
'use client'
import { incrementViews } from './actions'
import { useState, useEffect, useTransition } from 'react'

export default function ViewCount({ initialViews }: { initialViews: number }) {
  const [views, setViews] = useState(initialViews)
  const [isPending, startTransition] = useTransition()

  useEffect(() => {
    startTransition(async () => {
      const updatedViews = await incrementViews()
      setViews(updatedViews)
    })
  }, [])

  return <p>Total Views: {views}</p>
}
```

## Patterns

### Pending State

```tsx
'use client'
import { useActionState, startTransition } from 'react'

export function Button() {
  const [state, action, pending] = useActionState(createPost, false)
  return (
    <button onClick={() => startTransition(action)}>
      {pending ? <LoadingSpinner /> : 'Create Post'}
    </button>
  )
}
```

### Revalidating Cache

```ts
'use server'
import { revalidatePath } from 'next/cache'

export async function createPost(formData: FormData) {
  // Update data
  revalidatePath('/posts')
}
```

### Redirecting

```ts
'use server'
import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'

export async function createPost(formData: FormData) {
  // Update data
  revalidatePath('/posts')
  redirect('/posts')  // Call revalidation BEFORE redirect
}
```

### Managing Cookies

```ts
'use server'
import { cookies } from 'next/headers'

export async function exampleAction() {
  const cookieStore = await cookies()
  cookieStore.get('name')?.value    // Get
  cookieStore.set('name', 'Delba')  // Set
  cookieStore.delete('name')        // Delete
}
```
