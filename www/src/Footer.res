module Row = {
  @react.component
  let make = (~title: string, ~name: string, ~href: string) => {
    <div className="flex items-center">
      <span className="text-neutral-500"> {title->React.string} </span>
      <div className="w-full h-[1px] bg-neutral-200 mx-4" />
      <Link href={href} className="text-neutral-700 underline underline-offset-4">
        {name->React.string}
      </Link>
    </div>
  }
}

@react.component
let make = () => {
  <footer className="mt-20 flex flex-col">
    <Row title="Twitter" name="@geminimarcus" href="https://twitter.com/geminimarcus" />
    <Row title="GitHub" name="@marcustut" href="https://github.com/marcustut" />
    <Row title="Email" name="marcustutorial@hotmail.com" href="mailto:marcustutorial@hotmail.com" />
  </footer>
}
