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

    // is-value controls behavior of car pointer
    if is-value == true {
      // left down pointing line
      line((left-dot-x, y), (left-dot-x, y - drop), mark: (end: ">", size: 0.2), fill: black)

      // value
      rect(
        (left-dot-x - 0.5, y - drop),
        (left-dot-x + 0.5, y - drop - 1),
        radius: 0.15
      )
      content((left-dot-x, y - drop - 0.5), text(size: 14pt, [#value]))
    } else if is-value == "down-then-right" {
      // car ptr down and then to right
      line((left-dot-x, y), (left-dot-x, y - h - 2*drop))
      line((left-dot-x, y - h - 2*drop), (left-dot-x + (3/4)*w + gap, y - h - 2*drop), mark: (end: ">", size: 0.2), fill: black)
    } else if is-value == "up-shared" {
      // car ptr up to a shared value instead of down
      line((left-dot-x, y), (left-dot-x, y + drop), mark: (end: ">", size: 0.2), fill: black)
    } else {
      // longer vertical line
      line((left-dot-x, y), (left-dot-x, y - h - drop), mark: (end: ">", size: 0.2), fill: black)
    }

    // is-nil controls behavior of cdr pointer
    if is-nil == true {
      line((mid, bottom), (right - 0.05, top - 0.05))
    } else if is-nil == "long-down" {
      // right down pointing line
      let right-dot-x = right - w/4
      circle((right-dot-x, y), radius: 0.08, fill: black)

      line((right-dot-x, y), (right-dot-x, y - h - drop), mark: (end: ">", size: 0.2), fill: black)
    } else if is-nil == "point-back" {
      // point back to left line
      let right-dot-x = right - w/4
      circle((right-dot-x, y), radius: 0.08, fill: black)

      line((right-dot-x, y), (right-dot-x, y + 1.5))
      line((right-dot-x, y + 1.5), (left - gap - (3/4)*w, y + 1.5))
      line((left - gap - (3/4)*w, y + 1.5), (left - gap - (3/4)*w, y + 0.5*h), mark: (end: ">", size: 0.2), fill: black)
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

  label(0, 0, "z1", `z1`)
  node(0, 0, 0, false, "long-down")
  label(1, 0, "x", `x`)
  node(1, 0, `wow`, true, false)
  node(1, 1, `b`, true, true)

  label(3, 0, "z2", `z2`)
  node(3, 0, 0, "down-then-right", false)
  node(3, 1, `a`, true, false)
  node(3, 2, `b`, true, true)
  node(4.33, 1, `wow`, true, false)
  node(4.33, 2, 0, "up-shared", true)
})

