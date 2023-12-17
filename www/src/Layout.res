@react.component
let make = (~children: React.element) => {
  <div className="py-32 max-w-3xl mx-auto">
    <Navbar />
    children
    <Footer />
  </div>
}
