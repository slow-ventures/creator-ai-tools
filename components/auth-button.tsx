"use client"

import { useSession } from "next-auth/react"
import { SignInButton } from "./sign-in-button"
import { UserButton } from "./user-button"

export function AuthButton() {
  const { data: session, status } = useSession()

  if (status === "loading") {
    return <div className="h-8 w-20 animate-pulse rounded bg-muted" />
  }

  return session ? <UserButton /> : <SignInButton />
}
