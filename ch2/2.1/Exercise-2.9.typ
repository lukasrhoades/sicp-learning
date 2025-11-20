#import "@preview/cetz:0.4.2"

Let $a, b$ be the lower and upper bounds of interval 1.
Let $c, d$ be the lower and upper bounds of interval 2.
The width of interval 1 is $(b - a) / 2$ and the width of
interval 2 is $(d - c) / 2$.

Addition: the new lower bound is $a + c$ and the new upper
bound is $b + d$. The new width is $
((b + d) - (a + c)) / 2 = (b - a) / 2 + (d - c) / 2.
$
Let the function $f$ be the width of the sum of two intervals, 
and let $x$ be the width of the first interval, and $y$ be the
width of the second interval.
Then, $f(x, y) = x + y$.
This means that the width of the sum of two intervals is
a function only of the widths of the intervals being added.

Subtraction: the new lower bound is $a - d$ and the new upper
bound is $b - c$. The new width is $
((b - c) - (a - d)) / 2 = (b - a) / 2 + (d - c)/2.
$
If $f$ is now the width of the difference of two intervals, 
then again $f(x, y) =  x + y$. 
Thus, the width of the difference of two intervals is a function 
only of the widths of the intervals being subtracted.

The following examples show that this is not true for
multiplication or division. Run the associated scheme file
to confirm the results.

Example 1, axis from 0 to 14:
#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (14, 0))
  for x in range(0, 15) {
    line((x, -0.1), (x, +0.1))
  }

  line(name: "int1", (5, 6), (9, 6))
  content("int1.0", anchor: "east", padding: 1em, [interval 1])
  content("int1.10", anchor: "west", padding: 1em, [width: 2])
  circle((5, 6), radius: 0.1, fill: black)
  circle((9, 6), radius: 0.1, fill: black)

  line(name: "int2", (2, 5), (4, 5))
  content("int2.0", anchor: "east", padding: 1em, [interval 2])
  content("int2.10", anchor: "west", padding: 1em, [width: 1])
  circle((2, 5), radius: 0.1, fill: black)
  circle((4, 5), radius: 0.1, fill: black)

  line(name: "add", (7, 4), (13, 4))
  content("add.0", anchor: "east", padding: 1em, [addition])
  content("add.10", anchor: "west", padding: 1em, [width: 3])
  circle((7, 4), radius: 0.1, fill: black)
  circle((13, 4), radius: 0.1, fill: black)

  line(name: "sub", (1, 3), (7, 3))
  content("sub.0", anchor: "east", padding: 1em, [subtraction])
  content("sub.10", anchor: "west", padding: 1em, [width: 3])
  circle((1, 3), radius: 0.1, fill: black)
  circle((7, 3), radius: 0.1, fill: black)

  line(name: "mul", (10, 2), (36, 2))
  content("mul.0", anchor: "east", padding: 1em, [multiplication])
  content("mul.0", anchor: "north", padding: 1em, [width: 13])
  circle((10, 2), radius: 0.1, fill: black)
  circle((36, 2), radius: 0.1, fill: black)

  line(name: "div", (1.25, 1), (4.5, 1))
  content("div.0", anchor: "east", padding: 1em, [division])
  content("div.10", anchor: "west", padding: 1em, [width: 1.625])
  circle((1.25, 1), radius: 0.1, fill: black)
  circle((4.5, 1), radius: 0.1, fill: black)
})
Example 2, axis from -4 to 15:
#align(center)[
#cetz.canvas({
  import cetz.draw: *
  line((-4, 0), (15, 0))
  for x in range(-4, 15) {
    line((x, -0.1), (x, +0.1))
    line((x+0.5, -0.1), (x+0.5, +0.1))
  }
  line((15,-0.1), (15,0.1))

  line(name: "int3", (0, 6), (3, 6))
  content("int3.0", anchor: "east", padding: 1em, [interval 3])
  content("int3.10", anchor: "west", padding: 1em, [width: 3])
  circle((0, 6), radius: 0.1, fill: black)
  circle((3, 6), radius: 0.1, fill: black)

  line(name: "int4", (0.5, 5), (2.5, 5))
  content("int4.0", anchor: "east", padding: 1em, [interval 4])
  content("int4.10", anchor: "west", padding: 1em, [width: 2])
  circle((0.5, 5), radius: 0.1, fill: black)
  circle((2.5, 5), radius: 0.1, fill: black)

  line(name: "add", (0.5, 4), (5.5, 4))
  content("add.0", anchor: "east", padding: 1em, [addition])
  content("add.10", anchor: "west", padding: 1em, [width: 5])
  circle((0.5, 4), radius: 0.1, fill: black)
  circle((5.5, 4), radius: 0.1, fill: black)

  line(name: "sub", (-2.5, 3), (2.5, 3))
  content("sub.0", anchor: "east", padding: 1em, [subtraction])
  content("sub.10", anchor: "west", padding: 1em, [width: 5])
  circle((-2.5, 3), radius: 0.1, fill: black)
  circle((2.5, 3), radius: 0.1, fill: black)

  line(name: "mul", (0, 2), (15, 2))
  content("mul.0", anchor: "east", padding: 1em, [multiplication])
  content("mul.15", anchor: "south", padding: 1em, [width: 15])
  circle((0, 2), radius: 0.1, fill: black)
  circle((15, 2), radius: 0.1, fill: black)

  line(name: "div", (0, 1), (3, 1))
  content("div.0", anchor: "east", padding: 1em, [division])
  content("div.10", anchor: "west", padding: 1em, [width: 3])
  circle((0, 1), radius: 0.1, fill: black)
  circle((3, 1), radius: 0.1, fill: black)
})
]
