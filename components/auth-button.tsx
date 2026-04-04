"use client"

import { authClient } from "@/lib/auth-client"
import { SignInButton } from "./sign-in-button"
import { UserButton } from "./user-button"

export function AuthButton() {
  const { data: session, isPending } = authClient.useSession()

  if (isPending) {
    return <div className="h-8 w-20 animate-pulse rounded bg-muted" />
  }

  return session ? <UserButton /> : <SignInButton />
}
