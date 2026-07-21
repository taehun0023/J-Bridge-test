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
    request.nextUrl.pathname.startsWith('/signup') ||
    request.nextUrl.pathname.startsWith('/reset-password')

  const isApiRoute = request.nextUrl.pathname.startsWith('/api/')

  // 未認証ユーザー → ログインページへリダイレクト
  if (!user && !isAuthPage && !isApiRoute && !request.nextUrl.pathname.startsWith('/auth')) {
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

  // オンボーディング未完了のユーザーをオンボーディングページへリダイレクト
  const isOnboardingPage = request.nextUrl.pathname.startsWith('/onboarding')
  if (user && !isAuthPage && !isOnboardingPage) {
    const { data: profile } = await supabase
      .from('profiles')
      .select('is_onboarded, role')
      .eq('id', user.id)
      .single()

    if (profile && profile.is_onboarded === false) {
      const url = request.nextUrl.clone()
      url.pathname = '/onboarding'
      return NextResponse.redirect(url)
    }

    // RBAC: /ranking 경로 — admin + mentor만 접근 가능
    const { pathname } = request.nextUrl
    if (pathname.startsWith('/ranking')) {
      const role = profile?.role ?? 'mentee'
      if (role === 'mentee') {
        const url = request.nextUrl.clone()
        url.pathname = '/dashboard'
        return NextResponse.redirect(url)
      }
    }

    // RBAC: /admin 경로 역할 기반 접근 제어
    if (pathname.startsWith('/admin')) {
      const role = profile?.role ?? 'mentee'

      if (pathname.startsWith('/admin/users') || pathname.startsWith('/admin/courses') || pathname.startsWith('/admin/mentors')) {
        // admin only
        if (role !== 'admin') {
          const url = request.nextUrl.clone()
          url.pathname = '/dashboard'
          return NextResponse.redirect(url)
        }
      } else if (pathname.startsWith('/admin/tasks') || pathname.startsWith('/admin/reports')) {
        // admin + mentor
        if (role === 'mentee') {
          const url = request.nextUrl.clone()
          url.pathname = '/dashboard'
          return NextResponse.redirect(url)
        }
      } else {
        // 기타 /admin/* 경로 → admin only
        if (role !== 'admin') {
          const url = request.nextUrl.clone()
          url.pathname = '/dashboard'
          return NextResponse.redirect(url)
        }
      }
    }

    // カテゴリ管理: 削除(deleted)されたサブカテゴリは全員、無効化(is_active=false)はメンティーのアクセスを遮断
    const uRole = profile?.role ?? 'mentee'
    const LEARNING_PREFIXES = ['/japanese', '/cs', '/dev', '/business-literacy', '/coding', '/announcements']
    if (LEARNING_PREFIXES.some(p => pathname.startsWith(p))) {
      const { data: rows } = await supabase
        .from('subcategory_settings')
        .select('subcat_key, is_active, deleted')
      const blocked = (rows ?? []).some((d: { subcat_key: string; is_active: boolean; deleted: boolean }) => {
        const matches = pathname === d.subcat_key || pathname.startsWith(d.subcat_key + '/')
        return matches && (d.deleted || (uRole === 'mentee' && d.is_active === false))
      })
      if (blocked) {
        const url = request.nextUrl.clone()
        url.pathname = '/dashboard'
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
