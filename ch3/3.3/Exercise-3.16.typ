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
      let new-y = y - h - 2*drop
      line((left-dot-x, y), (left-dot-x, new-y))
      line((left-dot-x, new-y), (left-dot-x + (3/4)*w + gap, new-y), mark: (end: ">", size: 0.2), fill: black)
    } else if is-value == "up-shared" {
      // car ptr up to a shared value instead of down
      line((left-dot-x, y), (left-dot-x, y + drop), mark: (end: ">", size: 0.2), fill: black)
    } else if is-value == "up-long-value" {
      // car ptr up long to a value
      line((left-dot-x, y), (left-dot-x, y + h + drop), mark: (end: ">", size: 0.2), fill: black)

      //value
      rect(
        (left-dot-x - 0.5, y + h + drop),
        (left-dot-x + 0.5, y + h + drop + 1),
        radius: 0.15
      )
      content((left-dot-x, y + h + drop + 0.5), text(size: 14pt, [#value]))
    } else { 
      // longer vertical line
      line((left-dot-x, y), (left-dot-x, y - h - drop), mark: (end: ">", size: 0.2), fill: black)
    }
    
    // is-nil controls behavior of cdr pointer
    
    // cdr dot for everything except nil
    let right-dot-x = right - w/4
    if is-nil != true {
      circle(name: "test",(right-dot-x, y), radius: 0.08, fill: black)
    }

    if is-nil == true {
      line((mid, bottom), (right - 0.05, top - 0.05))
    } else if is-nil == "long-down" {
      // cdr ptr long down pointing line
      line((right-dot-x, y), (right-dot-x, y - h - drop), mark: (end: ">", size: 0.2), fill: black)
    } else if is-nil == "right-then-long-down" {
      // cdr ptr goes right then long down
      let new-x = right-dot-x + gap + (1/2)*w
      line((right-dot-x, y), (new-x, y))
      line((new-x, y), (new-x, y - h - drop), mark: (end: ">", size: 0.2), fill: black)
    } else if is-nil == "cdr-2x-long-down" {
      // access the cdr of 2 rows down
      let new-x = right-dot-x + gap + w
      line((right-dot-x, y), (new-x, y))
      line((new-x, y), (new-x, y - (1/2)*h - 2*(h + drop)), mark: (end: ">", size: 0.2), fill: black)
    } else if is-nil == "back-one" {
      // pointer back 1 pair
      let new-x = left - gap - (3/4)*w
      line((right-dot-x, y), (right-dot-x, y + 1.5))
      line((right-dot-x, y + 1.5), (new-x, y + 1.5))
      line((new-x, y + 1.5), (new-x, y + 0.5*h), mark: (end: ">", size: 0.2), fill: black)
    } else if is-nil == "loopback-1x" {
      // pointer back 1 pair (looping arc)
      arc(
        (right-dot-x, y),
        radius: 2,
        start: 0deg,
        delta: 165deg,
        mark: (
          end: ">",
          fill: black
        )
      )
    } else if is-nil == "loopback-2x" {
      // pointer back 1 pair (looping arc)
      arc(
        (right-dot-x, y),
        radius: 3.5,
        start: 0deg,
        delta: 172deg,
        mark: (
          end: ">",
          fill: black
        )
      )
    } else if type(is-nil) == str and is-nil.contains("right-value") {
      let cdr-value = is-nil.split(regex(";")).at(1)
      // right horizontal pointing line
      line((right-dot-x, y), (right + gap, y), mark: (end: ">", size: 0.2), fill: black)
      
      //value
      rect(
        (right-dot-x + 1.5, y + 0.5),
        (right-dot-x + 2.5, y - 0.5),
        radius: 0.15
      )
      content((right-dot-x + 2, y), text(size: 14pt, [#cdr-value]))
    } else {
      // right horizontal pointing line
      line((right-dot-x, y), (right + gap, y), mark: (end: ">", size: 0.2), fill: black)
    }
  }

  let label(row, column, name, value) = {
    let x = column * 3
    let y = row * -3

    line(name: name, (x - 1, y), (x, y), mark: (end: ">", size: 0.2), fill: black)
    content(name + ".0", anchor: "east", padding: 3pt, [#value])
  }

  label(0, 0, "3pair", `l`)
  node(0, 0, `a`, true, false)
  node(0, 1, `b`, true, false)
  node(0, 2, `c`, true, true)

  label(1.5, 0, "4pair", `(cons y x)`)
  node(1.5, 0, 0, false, "cdr-2x-long-down")
  label(2.5, 0, "y", `y`)
  node(2.5, 0, `a`, true, "right-then-long-down")
  label(3.5, 1, "x", `x`)
  node(3.5, 1, `b`, true, true)

  label(5, 0, "7pair", `(cons z z)`)
  node(5, 0, 0, false, "long-down")
  label(6, 0, "z", `z`)
  node(6, 0, 0, false, "long-down")
  label(7, 0, "x", `x`)
  node(7, 0, `b`, true, true)

  label(5, 2, "infpair", `l`)
  node(5, 2, `a`, true, false)
  node(5, 3, `b`, true, false)
  node(5, 4, `c`, true, "loopback-2x")
})

