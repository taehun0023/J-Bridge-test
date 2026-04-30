import { defineConfig } from 'vitest/config'
import path from 'path'

export default defineConfig({
  test: {
    globals: true,
    environment: 'node',
    include: ['src/**/*.test.ts'],
    coverage: {
      provider: 'v8',
      include: ['src/modules/**', 'src/lib/**'],
      exclude: ['src/**/*.test.ts'],
      // Thresholds set at the current scoring-module baseline to catch regressions.
      // Raise these as test coverage expands across other modules (see docs/HANDOVER.md).
      thresholds: {
        'src/modules/scoring/**': {
          lines: 50,
          statements: 50,
          functions: 70,
          branches: 45,
        },
      },
    },
  },
  resolve: {
    alias: {
      '@': path.resolve(__dirname, './src'),
    },
  },
})
