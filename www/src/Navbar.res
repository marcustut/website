@react.component
let make = () => {
  <header className="flex justify-between h-14">
    <a href="/" className="font-bold text-2xl"> {"Marcus Lee"->React.string} </a>
    <nav className="flex space-x-4">
      <Link href="/projects"> {"projects"->React.string} </Link>
      <Link href="/writing"> {"writing"->React.string} </Link>
      <Link href="/resume"> {"resume"->React.string} </Link>
    </nav>
  </header>
}
