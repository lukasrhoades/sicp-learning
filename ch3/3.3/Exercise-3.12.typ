#import "@preview/cetz:0.4.2"

#cetz.canvas({
  import cetz.draw: *

  // box dimensions
  let w = 2
  let h = 1
  let gap = 1
  let drop = 1.5
  let radius = 0.2

  let node(row, column, value, is-value, is-nil) = {
    let x = column * 3
    let y = row * -3

    let left = x
    let right = x + w
    let top = y + h/2
    let bottom = y - h/2
    let mid = x + w/2

    // box outline
    rect((left, bottom), (right, top), radius: radius, fill: luma(230))

    // dividing line
    line((mid, bottom), (mid, top))

    let left-dot-x = left + w/4
    circle((left-dot-x, y), radius: 0.08, fill: black)

    if is-value {
      // left down pointing line
      line((left-dot-x, y), (left-dot-x, y - drop), mark: (end: ">", size: 0.2), fill: black)

      // value
      rect(
        (left-dot-x - 0.5, y - drop),
        (left-dot-x + 0.5, y - drop - 1),
        radius: 0.15
      )
      content((left-dot-x, y - drop - 0.5), text(size: 14pt, [#value]))
    } else {
      // longer vertical line
      line((left-dot-x, y), (left-dot-x, y - h - drop), mark: (end: ">", size: 0.2), fill: black)
    }

    if is-nil == true {
      line((mid, bottom), (right - 0.05, top - 0.05))
    } else if is-nil == "custom" {
      // downward pointing line
      let right-dot-x = right - w/4
      circle((right-dot-x, y), radius: 0.08, fill: black)

      line((right-dot-x, y), (right-dot-x, y - 3.25), mark: (end: ">", size: 0.2), fill: black)
    } else {
      // right horizontal pointing line
      let right-dot-x = right - w/4
      circle((right-dot-x, y), radius: 0.08, fill: black)

      line((right-dot-x, y), (right + gap, y), mark: (end: ">", size: 0.2), fill: black)
    }
  }

  let label(row, column, name, value) = {
    let x = column * 3
    let y = row * -3

    line(name: name, (x - 1, y), (x, y), mark: (end: ">", size: 0.2), fill: black)
    content(name + ".0", anchor: "east", padding: 3pt, [#value])
  }

  label(0, 0, "x", `x`)
  node(0, 0, `a`, true, false)
  node(0, 1, `b`, true, true)

  label(1.25, 0, "y", `y`)
  node(1.25, 0, `c`, true, false)
  node(1.25, 1, `d`, true, true)

  label(2.5, 0, "z", `z`)
  node(2.5, 0, `a`, true, false)
  node(2.5, 1, `b`, true, false)
  node(2.5, 2, `c`, true, false)
  node(2.5, 3, `d`, true, true)

  label(4.95, 0, "x", `x`)
  label(5.05, 0, "z", `z`)
  node(5, 0, `a`, true, "custom")

  node(5, 1, `b`, true, true)

  label(6.25, 0.33, "y", `y`)
  node(6.25, 0.33, `c`, true, false)
  node(6.25, 1.33, `d`, true, true)
})

