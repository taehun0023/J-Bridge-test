# Tailwind CSS Utility-First Approach

> Source: https://tailwindcss.com/docs/utility-first

## Overview

Style elements by combining single-purpose utility classes directly in markup.

## Example

```html
<div class="mx-auto flex max-w-sm items-center gap-x-4 rounded-xl bg-white p-6 shadow-lg">
  <img class="size-12 shrink-0" src="/logo.svg" alt="Logo" />
  <div>
    <div class="text-xl font-medium text-black">ChitChat</div>
    <p class="text-gray-500">You have a new message!</p>
  </div>
</div>
```

## Benefits

1. **Speed** — No naming classes or switching files
2. **Safety** — Changes affect only that element
3. **Maintainability** — Easy to find and update
4. **Scalability** — CSS stops growing linearly

## State Variants

### Hover/Focus

```html
<button class="bg-sky-500 hover:bg-sky-700">Save changes</button>
```

### Responsive Breakpoints

```html
<div class="grid grid-cols-2 sm:grid-cols-3">...</div>
```

### Dark Mode

```html
<div class="bg-white dark:bg-gray-800">
  <h3 class="text-gray-900 dark:text-white">Title</h3>
</div>
```

## Arbitrary Values

```html
<button class="bg-[#316ff6]">Sign in with Facebook</button>
<div class="grid grid-cols-[24rem_2.5rem_minmax(0,1fr)]">...</div>
```

## Complex Selectors

```html
<!-- Stacked variants -->
<button class="dark:lg:data-current:hover:bg-indigo-600">...</button>

<!-- Group hover -->
<a class="group rounded-lg p-8">
  <span class="group-hover:underline">Read more…</span>
</a>
```

## Managing Duplication

### Loops
```jsx
{contributors.map(user => (
  <img class="inline-block h-12 w-12 rounded-full" src={user.avatarUrl} />
))}
```

### Components
```jsx
export function VacationCard({ img, title, pricing, url }) {
  return (
    <div>
      <img className="rounded-lg" src={img} />
      <div className="mt-1 font-bold text-gray-700">
        <a href={url} className="hover:underline">{title}</a>
      </div>
      <div className="mt-2 text-sm text-gray-600">{pricing}</div>
    </div>
  )
}
```

### Custom CSS Classes
```css
@layer components {
  .btn-primary {
    border-radius: calc(infinity * 1px);
    background-color: var(--color-violet-500);
    padding-inline: --spacing(5);
    font-weight: var(--font-weight-semibold);
    color: var(--color-white);
  }
}
```

## Style Conflicts

- Later classes override earlier ones
- Use `!` modifier to force: `bg-red-500!`
- Use `important` flag for all utilities: `@import "tailwindcss" important;`
- Use prefix to avoid conflicts: `@import "tailwindcss" prefix(tw);`
