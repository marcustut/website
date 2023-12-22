@react.component
let make = () => {
  <div className="flex flex-col">
    <span className="font-light text-neutral-500">
      {"a typical low-level nerd."->React.string}
    </span>
    <p className="mt-14 whitespace-pre-wrap">
      {`Currently a student at University College Dublin pursuing MSc Computer Science.

My passion...`->React.string}
    </p>
  </div>
}
