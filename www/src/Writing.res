module Typst = {
  @module("@myriaddreamin/typst.react") @react.component
  external make: (
    ~fill: string=?,
    ~artifact: string,
    ~format: [#json]=?,
  ) => React.element = "TypstDocument"
}

let get_file = (filename: string) =>
  async _ => {
    await (await Fetch.get("/" ++ filename))->Fetch.Response.text
  }

@react.component
let make = () => {
  let raw = ReactQuery.useQuery({
    queryFn: get_file("test.artifact.sir.in"),
    queryKey: ["test.artifact.sir.in"],
  })

  Console.log(raw.data)

  switch raw.data {
    | Some(data) =>
        <Typst
        artifact={data}
        format=#json
        />
    | None => <div>{"loading"->React.string}</div>
  }
}
