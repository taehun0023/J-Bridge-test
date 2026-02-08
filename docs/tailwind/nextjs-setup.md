# Tailwind CSS with Next.js Setup

> Source: https://tailwindcss.com/docs/guides/nextjs

## Installation Steps

### 1. Create Project

```bash
npx create-next-app@latest my-project --typescript --eslint --app
cd my-project
```

### 2. Install Tailwind CSS

```bash
npm install tailwindcss @tailwindcss/postcss postcss
```

### 3. Configure PostCSS

```javascript
// postcss.config.mjs
const config = {
  plugins: {
    "@tailwindcss/postcss": {},
  },
};
export default config;
```

### 4. Import Tailwind CSS

```css
/* app/globals.css */
@import "tailwindcss";
```

### 5. Start Dev Server

```bash
npm run dev
```

### 6. Use Tailwind

```tsx
// app/page.tsx
export default function Home() {
  return (
    <h1 className="text-3xl font-bold underline">
      Hello world!
    </h1>
  )
}
```

## Key Points

- Uses `@tailwindcss/postcss` plugin
- TypeScript support included by default
- Utility classes applied directly in JSX/TSX
