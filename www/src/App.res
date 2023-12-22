@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  <Layout>
    {switch url.path {
    | list{} => <Home />
    | list{"projects"} => <Project />
    | list{"writing"} => <Writing />
    | list{"resume"} => <Resume />
    | _ => <span className="text-neutral-500"> {"Not found"->React.string} </span>
    }}
  </Layout>
}
