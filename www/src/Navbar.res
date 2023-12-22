@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()
  let handleNavigate = React.useCallback0(path => RescriptReactRouter.push(path))

  let path = React.useMemo1(_ =>
    switch url.path {
    | list{} => ""
    | list{path, ..._} => path
    }
  , [url.path])

  <header className="flex justify-between h-14">
    <Link onClick={_ => handleNavigate("/")} className="font-bold text-2xl text-black">
      <div className="flex items-center space-x-2">
        <span> {"Marcus Lee"->React.string} </span>
        {switch url.path {
        | list{} => <> </>
        | _ =>
          <>
            <div className="w-4 h-[2px] bg-neutral-400" />
            <span className="font-light capitalize"> {path->React.string} </span>
          </>
        }}
      </div>
    </Link>
    <nav className="flex space-x-4">
      <Link onClick={_ => handleNavigate("projects")}> {"projects"->React.string} </Link>
      <Link onClick={_ => handleNavigate("writing")}> {"writing"->React.string} </Link>
      <Link onClick={_ => handleNavigate("resume")}> {"resume"->React.string} </Link>
    </nav>
  </header>
}
