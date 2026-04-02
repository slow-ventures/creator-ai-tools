"use server"

import { signIn } from "@/auth"
import { prisma } from "@/lib/db/prisma"
import bcrypt from "bcryptjs"
import { AuthError } from "next-auth"

export async function signUp(formData: FormData) {
  const name = formData.get("name") as string
  const email = formData.get("email") as string
  const password = formData.get("password") as string

  if (!email || !password) {
    return { error: "Email and password are required" }
  }

  if (password.length < 6) {
    return { error: "Password must be at least 6 characters" }
  }

  const existing = await prisma.user.findUnique({
    where: { email },
  })

  if (existing) {
    return { error: "An account with this email already exists" }
  }

  const hashed = await bcrypt.hash(password, 10)

  await prisma.user.create({
    data: {
      name: name || null,
      email,
      password: hashed,
    },
  })

  try {
    await signIn("credentials", {
      email,
      password,
      redirectTo: "/protected",
    })
  } catch (error) {
    if (error instanceof AuthError) {
      return { error: "Failed to sign in after registration" }
    }
    throw error
  }
}

export async function signInWithCredentials(formData: FormData) {
  const email = formData.get("email") as string
  const password = formData.get("password") as string

  try {
    await signIn("credentials", {
      email,
      password,
      redirectTo: "/protected",
    })
  } catch (error) {
    if (error instanceof AuthError) {
      return { error: "Invalid email or password" }
    }
    throw error
  }
}
