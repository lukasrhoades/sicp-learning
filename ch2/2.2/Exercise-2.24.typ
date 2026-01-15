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
      line((left-dot-x, y), (left-dot-x, y - drop - h), mark: (end: ">", size: 0.2), fill: black)
    }

    if is-nil {
      line((mid, bottom), (right - 0.05, top - 0.05))
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

  label(0, 0, "list1", `(1 (2 (3 4)))`)
  node(0, 0, 1, true, false)
  node(0, 1, 0, false, true)

  label(1, 1, "list2", `(2 (3 4))`)
  node(1, 1, 2, true, false)
  node(1, 2, 0, false, true)

  label(2, 2, "list3", `(3 4)`)
  node(2, 2, 3, true, false)
  node(2, 3, 4, true, true)
})

#cetz.canvas({
  cetz.tree.tree(
    (
      `(1 (2 (3 4)))`,
      `1`,
      (
        `(2 (3 4))`,
        `2`,
        (
          `(3 4)`,
          `3`,
          `4`
        )
      )
    )
  )
})
