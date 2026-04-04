import { AuthButton } from "@/components/auth-button"
import { ThemeSwitcher } from "@/components/theme-switcher"
import Link from "next/link"

export default function Home() {
  return (
    <main className="min-h-screen flex flex-col items-center">
      <div className="flex-1 w-full flex flex-col gap-20 items-center">
        <nav className="w-full flex justify-center border-b border-b-foreground/10 h-16">
          <div className="w-full max-w-5xl flex justify-between items-center p-3 px-5 text-sm">
            <div className="flex gap-5 items-center font-semibold">
              <Link href="/">Hackathon Starter</Link>
            </div>
            <AuthButton />
          </div>
        </nav>
        <div className="flex-1 flex flex-col gap-20 max-w-5xl p-5">
          <div className="flex flex-col gap-16 items-center">
            <h1 className="text-3xl lg:text-4xl !leading-tight mx-auto max-w-xl text-center">
              Next.js + Better Auth + Prisma
            </h1>
            <p className="text-center text-muted-foreground max-w-md">
              A hackathon starter template with email/password authentication, type-safe database
              queries, and automatic schema migrations on deploy.
            </p>
            <div className="flex gap-4">
              <Link
                href="/protected"
                className="inline-flex items-center justify-center rounded-md bg-primary px-4 py-2 text-sm font-medium text-primary-foreground hover:bg-primary/90"
              >
                Go to Dashboard
              </Link>
            </div>
            <div className="w-full p-[1px] bg-gradient-to-r from-transparent via-foreground/10 to-transparent my-8" />
          </div>
        </div>

        <footer className="w-full flex items-center justify-center border-t mx-auto text-center text-xs gap-8 py-16">
          <p>Built at the Slow Ventures Creator Fund AI Hackathon</p>
          <ThemeSwitcher />
        </footer>
      </div>
    </main>
  )
}
