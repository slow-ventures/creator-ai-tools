import { PrismaClient } from "@prisma/client"
import bcrypt from "bcryptjs"

const prisma = new PrismaClient()

async function main() {
  const password = await bcrypt.hash("password", 10)

  const users = [
    { name: "Alice", email: "alice@example.com", password },
    { name: "Bob", email: "bob@example.com", password },
    { name: "Charlie", email: "charlie@example.com", password },
  ]

  for (const user of users) {
    await prisma.user.upsert({
      where: { email: user.email },
      update: {},
      create: user,
    })
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
