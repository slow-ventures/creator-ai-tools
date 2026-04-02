import { auth } from "@/auth"

const publicRoutes = ["/", "/sign-in", "/sign-up", "/api/auth"]

export default auth((req) => {
  const { pathname } = req.nextUrl
  const isPublic = publicRoutes.some(
    (route) => pathname === route || pathname.startsWith(route + "/")
  )

  if (!req.auth && !isPublic) {
    const signInUrl = new URL("/sign-in", req.nextUrl.origin)
    signInUrl.searchParams.set("callbackUrl", req.nextUrl.href)
    return Response.redirect(signInUrl)
  }
})

export const config = {
  matcher: ["/((?!_next/static|_next/image|favicon.ico|.*\\.(?:svg|png|jpg|jpeg|gif|webp)$).*)"],
}
