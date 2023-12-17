@react.component
type props = JsxDOM.domProps

let make = (props: props) => {
  <a
    {...props}
    className={`transition-colors duration-200 text-neutral-500 hover:text-black ${switch props.className {
      | Some(cn) => cn
      | None => ""
      }}`}>
    {switch props.children {
    | Some(children) => children
    | None => React.null
    }}
  </a>
}
