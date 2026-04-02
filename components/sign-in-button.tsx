import { Button } from "@/components/ui/button"
import Link from "next/link"

export function SignInButton() {
  return (
    <div className="flex gap-2">
      <Button asChild size="sm" variant="outline">
        <Link href="/sign-in">Sign in</Link>
      </Button>
      <Button asChild size="sm">
        <Link href="/sign-up">Sign up</Link>
      </Button>
    </div>
  )
}
