#import "@preview/cetz:0.1.2"

#let project(
  title: "", 
  authors: (), 
  date: none, 
  font: "linux libertine",
  monofont: "Courier",
  numbering: "1.1",
  body
) = {
  set document(author: authors.map(a => a.name), title: title)
  set page(margin: 1in, numbering: "1", number-align: center)
  set heading(numbering: "1.1")
  set text(font: font, lang: "en")
  show raw: set text(font: monofont)
  show par: set block(spacing: 0.55em)
  show heading: set block(above: 1.4em, below: 1em)

  // Title row.
  align(center)[#text(1.75em, title)]

  // Author information.
  pad(
    top: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center)[
        #text(1em, author.name)
        #v(0.5em, weak: true)
        #text(1.2em, raw(author.email))
      ]),
    ),
  )

  // Date.
  align(center)[
    #text(0.9em, date)
  ]

  // Main body.
  set par(leading: 0.55em, justify: true)

  body
}

#let section(prefix: "", title: "", space: 0.5em, body) = {
  block(above: 1.4em, below: 1em)
  strong(prefix)
  h(space)
  text(title)
  
  body
}

#show: project.with(
  title: "ACM40290: Assignment 4",
  authors: (
    (name: "Lee Kai Yang (23205838)", email: "kai.y.lee@ucdconnect.ie"),
  ),
  date: "November 22, 2023",
  font: "CMU Serif",
  monofont: "CMU Typewriter Text",
)

#show: section.with(
  prefix: "Question 1.",
  title: [
    Consider numerically integrating the initial value problem \
    $ frac(d y, d t) = f(t, y), #h(5em) y(0) = y_0 $
    using the Leapfrog scheme given by \
    $ frac(Y^(k+1) - Y^(k-1), 2h) = f(t_k, Y^k) $ 
    where $Y^k$ is the numerical approximation to the solution $y(t_k)$ with constant time-step sizes $h$.
  ],
)

#show: section.with(
  prefix: "Problem 1a.",
  title: [
    Show that the numerical solution arising from this scheme has a local truncation error of $O(h^3)$.
  ]
)

#show: section.with(
  prefix: "Solution",
  title: [],
)

Rearranging the scheme: 

$ Y^(k+1) &= Y^(k-1) + 2h f(t_k, Y^k) $

The local error would be: 

$ "local error" &= y(t_(k+1)) -  Y^(k+1) $

where $y(t_(k+1))$ is the exact solution and $Y^(k+1)$ is the numerical approximation. Then we Taylor expand the term $y(t_(k+1))$ to the third-order since the Leapfrog scheme is a second-order method:

$ y(t_(k+1)) &= y(t_k + h) \
             &= y(t_k) + h y'(t_k, y(t_k)) + frac(h^2,2) y''(t_k, y(t_k)) + frac(h^3,6) y'''(theta) \
             &= y(t_k) + h f(t_k, y(t_k)) + frac(h^2,2) f'(t_k, y(t_k)) + frac(h^3,6) f''(theta)
$

Substitute it back to the local error:

$ "local error" &= y(t_k) + h f(t_k, y(t_k)) + frac(h^2,2) f'(t_k, y(t_k)) + frac(h^3,6) f''(theta) - [Y^(k-1) + 2h f(t_k, Y^k)] \ 
                &= underbrace(y(t_k) - Y^(k-1) + h f(t_k, y(t_k)) - 2h f(t_k, Y^k) + frac(h^2,2) f'(t_k, y(t_k)), "error propagated from " t_k) + underbrace(frac(h^3,6) f''(theta), "local truncation error") $

Note that since local error is between one subsequent step hence $theta in (t_k, t_k + h)$. The local truncation error is $O(h^3)$ because $h^3$ is the highest order term in the expression $h^3/6 f''(theta)$.

#show: section.with(
  prefix: "Problem 1b.",
  title: [
    What is the first value of $k$, for numerical solution $Y^k$, that you can calculate with this method? Given $Y^0 = y_0$, suggest how you might find any additional (intermediate) solution values required.
  ]
)

#show: section.with(prefix: "Solution")

To use the Leapfrog scheme, we need to have $Y_0$, $Y_1$ and $Y_2$ because of the term $Y^k$, $Y^(k-1)$ and $Y^(k+1)$. Hence, the first value of $k$ that can be calculated in this method is $k=1$.

$ "when" k = 1, #h(1em) (Y^(2) - Y^(0))/2h = f(t_1, Y^1) $

Given $Y^0 = y_0$, to find $Y_1$ and $Y_2$ we can use the Forward Euler's method: 

$ Y^(n+1) = Y^n + h f(Y^n) $

This will form $Y^(1) = Y^0 + h f(t_0, Y^0)$ and $Y^(2) = Y^1 + h f(t_1, Y^1)$.

#show: section.with(
  prefix: "Question 2.",
  title: [
    For the ordinary differential equation \
    $ frac("dy", "dt") = f(t) $ \ 
    we wish to use an integration scheme given by \
    $ y_(j+2) = y_(j+1) + frac(h, 2)(3f_(j+1) - f_j) $ \
    where $h$ is the time-step. Take $y_(j+2) = y(t_j + 2h)$, $y_(j+1) = y(t_j + h)$, $f_j = f(t_j)$ and $f_(j+1) = f(t_j + h)$.
  ],
)

#show: section.with(
  prefix: "Problem 2a.",
  title: [
    Show that the local error is $O(h^3)$ and global error for $N approx 1"/"h$ steps is $O(h^2)$.
  ]
)

#show: section.with(
  prefix: "Solution",
  title: [],
)

Taylor expand the term $y_(j+2)$:

$ y_(j+2) &= y(t_j + 2h) \
          &= y(t_j) + 2h y'(t_j) + 2h^2 y''(t_j) + 4/3 h^3 y'''(theta) \
          &= y(t_j) + 2h f(t_j) + 2h^2 f'(t_j) + 4/3 h^3 f''(theta) $

Substituting it into the local error:

$ "local error" &= y_(j+2) - y_(j+1) - frac(h, 2)(3f_(j+1) - f_j) \ 
                &= y(t_j + 2h) - y(t_j + h) - frac(h, 2)(3f(t_j + h) - f(t_j)) \
                &= y(t_j) + 2h f(t_j) + 2h^2 f'(t_j) + 4/3 h^3 f''(theta) - y(t_j + h) - frac(h, 2)(3f(t_j + h) - f(t_j)) \ 
                &= underbrace(y(t_j) - y(t_j + h) + (5h)/2 f(t_j) - frac(3h, 2)f(t_j + h) + 2h^2 f'(t_j), "error propagated from " t_j) + underbrace(4/3 h^3f''(theta), "local truncation error") $

Note that since local error is between one subsequent step hence $theta in (t_j, t_j + h)$. The local error is $O(h^3)$ because $h^3$ is the highest order term in the expression $4/3 h^3 f''(theta)$.

#v(1em)

Since local error is $4/3 h^3 f''(theta)$ then global error must be $N dot 4/3 h^3 f''(theta)$ for $theta in (t_0, t_N)$ hence:

$ "global error" &approx N dot 4/3 h^3 f''(theta) \
                 &approx 1/h 4/3 h^3 f''(theta) \
                 &approx 4/3 h^2 f''(theta) $

Therefore, the global error is $O(h^2)$ because the highest order term in the expression $4/3 h^2 f''(theta)$ is $h^2$.

#show: section.with(
  prefix: "Problem 2b.",
  title: [
    The scheme requires two prior points to calculate the next one. If given a single initial point $y_0$, explain in two sentences how might you generate a $y_1$ so that you can begin the numerical method at $y_2$.
  ]
)

#show: section.with(
  prefix: "Solution",
  title: [],
)

Given the initial point $y_0$, we can use a single-step method such as Forward Euler's method to get a good approximation of $y_1$ with a step size of $h$: 

$ y_1 = y_0 + h f(t_0) $ 

Then this value of $y_1$ can then be used in conjunction with the initial point $y_0$ to begin the numerical method at $y_2$.

#show: section.with(
  prefix: "Question 3.",
  title: [
    For the IVP,
    $ frac("du", "dt") = lambda u #h(5em) u(0) = u_0 $
    consider the numerical scheme 
    $ U^(n+1) = U^n + h lambda (frac(U^n, 2) + frac(U^(n+1), 2)) $
    with $U^0 = u_0, U^n approx u(t_n) "for" n > 0, "and" h "the time step."$
  ]
)

#show: section.with(
  prefix: "Problem 3a.",
  title: [
    Rewrite the above scheme as 
    $ U^(n+1) = g(h, lambda) U^n $
    for a function $g$ of $h$ and $lambda$ to be determined.
  ]
)

#show: section.with(
  prefix: "Solution",
)

$ U^(n+1) &= U^n + h lambda U^n/2 + h lambda U^(n+1)/2 \
  U^(n+1) - h lambda U^(n+1)/2 &= U^n + h lambda (U^n)/2 \
  U^(n+1) (1 - (h lambda)/2) &= U^n (1 + (h lambda)/2) \
  U^(n+1) &= (1 + (h lambda)/2)/(1 - (h lambda)/2) U^n $

Hence, 

$ g(h, lambda) = (1+(h lambda)/2)/(1 - (h lambda)/2) $

#show: section.with(
  prefix: "Problem 3b.",
  title: [
    Determine the range of values of $h$ for which the solution is stable. Note: when considering the step $| dot | < 1$ you may then need to write $h lambda$ as a complex number, i.e., $h lambda = a + i b$, to determine the condition in full ($lambda$ may be complex, but it is easier here to use $h lambda$ as a single variable).
  ]
)

#show: section.with(
  prefix: "Solution"
)

For the solution to be stable, $abs((1+(h lambda)/2)/(1 - (h lambda)/2)) < 1$ must be true.

Let $h lambda = a + i b$, we can write 

$ abs((1+(a + i b)/2)/(1 - (a + i b)/2)) &< 1 \
  abs(((2 + a + i b)/2)/((2 - a - i b)/2)) &< 1 \
  abs((2 + a + i b)/(2 - a - i b)) &< 1 \
  sqrt((2 + a)^2 + b^2)/sqrt((2 - a)^2 + b^2) &< 1 \
  ((2 + a)^2 + b^2)/((2 - a)^2 + b^2) &< 1 \
  (2 + a)^2 + b^2 &< (2 - a)^2 + b^2 \
  4 + a^2 + 4a + b^2 &< 4 + a^2 - 4a + b^2 $

$ 4a &< - 4a \
  8a &< 0 \
  a &< 0 $

Since $a$ is the real part of $h lambda$, therefore we can say that for the solution to be stable, the real part of $h lambda$ must be negative (lesser than $0$). Visualising it on the cartesian plane, it looks as follows:

#align(center)[
  #figure(
    cetz.canvas(length: 2cm, {
      import cetz.draw: *

      set-style(
        mark: (fill: black),
      )

      grid((-1.5, -1.5), (1.4, 1.4), step: 0.5, stroke: gray + 0.2pt)

      line((-1.5, 0), (1.5, 0), mark: (end: ">"))
      content((), $ x $, anchor: "left")
      line((0, -1.5), (0, 1.5), mark: (end: ">"))
      content((), $ y $, anchor: "bottom")

      for (x, ct) in ((-1, $ -2 $), (-0.5, $ -1 $), (0, $ 0 $), (0.5, $ 1 $), (1, $ 2 $)) {
        line((x, 3pt), (x, -3pt))
        content((), anchor: "above", padding: 4pt, ct)
      }

      rect(
        (-1.5, -1.5), 
        (0, 1.4), 
        stroke: (dash: "dashed", paint: blue), 
        fill: color.linear-rgb(135,206,250,50%)
      )
      line((-1.5, 1), (-1.25, 1.4), stroke: color.linear-rgb(0,0,139))
      line((-1.5, 0.5), (-1, 1.4), stroke: color.linear-rgb(0,0,139))
      line((-1.5, 0), (-0.75, 1.4), stroke: color.linear-rgb(0,0,139))
      line((-1.5, -0.5), (-0.5, 1.4), stroke: color.linear-rgb(0,0,139))
      line((-1.5, -1), (-0.25, 1.4), stroke: color.linear-rgb(0,0,139))
      line((-1.5, -1.5), (0, 1.4), stroke: color.linear-rgb(0,0,139))
      line((-1.25, -1.5), (0, 0.9), stroke: color.linear-rgb(0,0,139))
      line((-1.0, -1.5), (0, 0.4), stroke: color.linear-rgb(0,0,139))
      line((-0.75, -1.5), (0, -0.1), stroke: color.linear-rgb(0,0,139))
      line((-0.5, -1.5), (0, -0.6), stroke: color.linear-rgb(0,0,139))
      line((-0.25, -1.5), (0, -1.1), stroke: color.linear-rgb(0,0,139))
    }),
    caption: [Range of stable solution]
  )
]

where the blue region indicate the region where the solution is stable.

#show: section.with(
  prefix: "Question 4.",
  title: [
    Consider the linear system 
    $ y'' - (lambda - 1)y' - lambda y = 0, #h(1em) y(0) = 1, #h(1em) y'(0) = - lambda - 2 $
    for $lambda < 0$. Determine which of $lambda = -2$ or $lambda = -45$ will produce a stiff system.
  ]
)

#show: section.with(
  prefix: "Solution",
  title: [],
)

First we linearise the system:

#v(1em)

Let $v = y'$ and $v' = y''$, then we will have

$ frac("dy", "dt") = y' = v $
$ v' - (lambda - 1)v - lambda y &= 0 \  
                             v' &= (lambda - 1)v + lambda y $

Now we express it in matrix form: 

#v(1em)

Let $Y = mat(y; v)$, then 

$ frac("dY", "dt") &= A mat(y; v) \ 
                   &= mat(0, 1; lambda, lambda - 1) mat(y; v) $

Find the eigenvalues of $A$ when $lambda = -2$:

$ det(lambda I - A) &= 0 \
  det(lambda mat(1, 0; 0, 1) - mat(0, 1; -2, -3)) &= 0 \ 
  det mat(lambda, -1; 2, lambda + 3) &= 0 \
  lambda^2 + 3 lambda + 2 &= 0 $

$ lambda = frac(-3 plus.minus sqrt(3^2 - 4(1)(2)), 2) = frac(-3 plus.minus sqrt(1), 2) $

$ lambda_+ = -1, #h(1em) lambda_- = -2 $

Find the eigenvalues of $A$ when $lambda = -45$:

$ det(lambda I - A) &= 0 \
  det(lambda mat(1, 0; 0, 1) - mat(0, 1; -45, -46)) &= 0 \ 
  det mat(lambda, -1; 45, lambda + 46) &= 0 \
  lambda^2 + 46 lambda + 45 &= 0 $

$ lambda = frac(-46 plus.minus sqrt(46^2 - 4(1)(45)), 2) = frac(-46 plus.minus sqrt(1936), 2) = frac(-46 plus.minus 44, 2) $

$ lambda_+ = -1, #h(1em) lambda_- = -45 $

Since stiffness arises when $max |lambda_j| >> min |lambda_j|$, $lambda = -45$ will produce a stiff system because $45 >> 1$.
