import { z } from 'zod'

/**
 * Server-side environment variables validated at import time.
 * Required vars throw on startup; optional vars fall back to defaults.
 */
const serverSchema = z.object({
  // Supabase (required)
  NEXT_PUBLIC_SUPABASE_URL: z.string().url(),
  NEXT_PUBLIC_SUPABASE_ANON_KEY: z.string().min(1),

  // Supabase service role (optional — some features degrade gracefully)
  SUPABASE_SERVICE_ROLE_KEY: z.string().min(1).optional(),

  // Judge0 code execution (optional — coding features disabled without it)
  JUDGE0_API_URL: z.string().url().default('http://localhost:2358'),
  JUDGE0_API_KEY: z.string().default(''),

  // Google Cloud TTS (optional — TTS features disabled without it)
  GOOGLE_CLOUD_TTS_API_KEY: z.string().min(1).optional(),

  // Weavusys service-to-service API key (optional — J-Bridge BFF disabled without it)
  WEAVUSYS_API_KEY: z.string().min(1).optional(),
})

export type ServerEnv = z.infer<typeof serverSchema>

function validateEnv(): ServerEnv {
  const result = serverSchema.safeParse(process.env)
  if (!result.success) {
    const formatted = result.error.issues
      .map((i) => `  ${i.path.join('.')}: ${i.message}`)
      .join('\n')
    throw new Error(`Environment validation failed:\n${formatted}`)
  }
  return result.data
}

export const env = validateEnv()
