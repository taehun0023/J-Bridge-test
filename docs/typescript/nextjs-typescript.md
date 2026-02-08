# TypeScript in Next.js

> Source: https://nextjs.org/docs/app/building-your-application/configuring/typescript

## Overview

Next.js includes built-in TypeScript support with automatic dependency installation and configuration.

## Setup

### New Project
```bash
npx create-next-app@latest --typescript
```

### Existing Project
1. Rename files to `.ts`/`.tsx`
2. Run `next dev` or `next build`
3. Dependencies and `tsconfig.json` auto-created

## IDE Plugin

Enable in VS Code:
1. `Ctrl/Cmd + Shift + P`
2. "TypeScript: Select TypeScript Version"
3. "Use Workspace Version"

### Plugin Capabilities
- Validates segment config options
- Shows available options with documentation
- Ensures `'use client'` directive usage
- Validates client hooks in Client Components

## Type-Safe Data Fetching

```tsx
async function getData() {
  const res = await fetch('https://api.example.com/...')
  return res.json() // Can return Date, Map, Set, etc.
}

export default async function Page() {
  const data = await getData()
  return '...'
}
```

## Route-Aware Type Helpers

Globally available (generated during `next dev`/`next build`):

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

## Typed Configuration

```ts
// next.config.ts
import type { NextConfig } from 'next'

const nextConfig: NextConfig = {
  /* config options */
}

export default nextConfig
```

## Statically Typed Links

```ts
// next.config.ts
const nextConfig: NextConfig = {
  typedRoutes: true,
}
```

```tsx
'use client'
import type { Route } from 'next'
import Link from 'next/link'

<Link href="/about" />          // ✅ Valid
<Link href="/aboot" />          // ❌ TypeScript error
<Link href={`/blog/${slug}`} /> // ✅ Dynamic
```

## Environment Variable Types

```ts
const nextConfig: NextConfig = {
  experimental: {
    typedEnv: true,
  },
}
```

## Incremental Type Checking

```json
// tsconfig.json
{
  "compilerOptions": {
    "incremental": true
  }
}
```

## Custom tsconfig Path

```ts
const nextConfig: NextConfig = {
  typescript: {
    tsconfigPath: 'tsconfig.build.json',
  },
}
```

## Disabling Build Errors (Dangerous)

```ts
const nextConfig: NextConfig = {
  typescript: {
    ignoreBuildErrors: true, // ⚠️ Only if type-checking elsewhere
  },
}
```

## tsconfig.json Include

```json
{
  "include": [
    "next-env.d.ts",
    ".next/types/**/*.ts",
    "**/*.ts",
    "**/*.tsx"
  ],
  "exclude": ["node_modules"]
}
```
