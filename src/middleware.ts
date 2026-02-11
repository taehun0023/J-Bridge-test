import { createServerClient } from '@supabase/ssr'
import { NextResponse, type NextRequest } from 'next/server'

export async function middleware(request: NextRequest) {
  let supabaseResponse = NextResponse.next({ request })

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll()
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value }) =>
            request.cookies.set(name, value)
          )
          supabaseResponse = NextResponse.next({ request })
          cookiesToSet.forEach(({ name, value, options }) =>
            supabaseResponse.cookies.set(name, value, options)
          )
        },
      },
    }
  )

  const {
    data: { user },
  } = await supabase.auth.getUser()

  const isAuthPage =
    request.nextUrl.pathname.startsWith('/login') ||
    request.nextUrl.pathname.startsWith('/signup')

  // 未認証ユーザー → ログインページへリダイレクト
  if (!user && !isAuthPage && !request.nextUrl.pathname.startsWith('/auth')) {
    const url = request.nextUrl.clone()
    url.pathname = '/login'
    return NextResponse.redirect(url)
  }

  // 認証済みユーザーがログイン/サインアップページにアクセス → ダッシュボードへリダイレクト
  if (user && isAuthPage) {
    const url = request.nextUrl.clone()
    url.pathname = '/dashboard'
    return NextResponse.redirect(url)
  }

  // オンボーディングチェック: 認証済みユーザーがオンボーディング未完了の場合、適切なオンボーディングステップへリダイレクト
  const isOnboardingPage = request.nextUrl.pathname.startsWith('/onboarding')
  if (user && !isAuthPage && !request.nextUrl.pathname.startsWith('/auth')) {
    const { data: profile } = await supabase
      .from('profiles')
      .select('is_onboarded, role, onboarding_step')
      .eq('id', user.id)
      .single()

    if (profile && !profile.is_onboarded && profile.role !== 'admin') {
      if (!isOnboardingPage) {
        const url = request.nextUrl.clone()
        const step = profile.onboarding_step ?? 0
        if (step === 0) {
          url.pathname = '/onboarding'
        } else if (step >= 1 && step <= 5) {
          url.pathname = `/onboarding/assessment/${step}`
        } else {
          url.pathname = '/onboarding/results'
        }
        return NextResponse.redirect(url)
      }
    }
  }

  return supabaseResponse
}

export const config = {
  matcher: [
    '/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)',
  ],
}
