import { PrismaClient } from "@prisma/client"
import { betterAuth } from "better-auth"
import { prismaAdapter } from "better-auth/adapters/prisma"

const prisma = new PrismaClient()

const auth = betterAuth({
  database: prismaAdapter(prisma, { provider: "postgresql" }),
  emailAndPassword: { enabled: true },
})

async function main() {
  const users = [
    { name: "Alice", email: "alice@example.com", password: "password" },
    { name: "Bob", email: "bob@example.com", password: "password" },
    { name: "Charlie", email: "charlie@example.com", password: "password" },
  ]

  for (const user of users) {
    const existing = await prisma.user.findUnique({
      where: { email: user.email },
    })
    if (!existing) {
      await auth.api.signUpEmail({ body: user })
    }
  }

  console.log("Seeded 3 demo users (password: 'password')")
  console.log("  alice@example.com")
  console.log("  bob@example.com")
  console.log("  charlie@example.com")
}

main()
  .catch((e) => {
    console.error(e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
