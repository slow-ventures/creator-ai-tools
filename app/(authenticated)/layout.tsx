import { auth } from "@/auth"
import { redirect } from "next/navigation"
import { Suspense } from "react"

async function AuthGate({ children }: { children: React.ReactNode }) {
  const session = await auth()
  if (!session) redirect("/sign-in")
  return <>{children}</>
}

export default function AuthenticatedLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <Suspense fallback={<div className="min-h-screen flex items-center justify-center text-sm text-muted-foreground">Loading...</div>}>
      <AuthGate>{children}</AuthGate>
    </Suspense>
  )
}
