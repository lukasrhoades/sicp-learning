#table(
  columns: 5,
  [*LB x*], [*UB x*], [*LB y*], [*UB y*], [*Result*],
  [Positive], [Positive], [Positive], [Positive],
  [(LBxLBy, UBxUBy)],
  [Positive], [Positive], [Negative], [Positive],
  [(UBxLBy, UBxUBy)],
  [Positive], [Positive], [Negative], [Negative],
  [(UBxLBy, LBxUBy)],
  [Negative], [Negative], [Negative], [Negative],
  [(UBxUBy, LBxLBy)],
  [Negative], [Negative], [Negative], [Positive],
  [(LBxUBy, LBxLBy)],
  [Negative], [Negative], [Positive], [Positive],
  [(LBxUBy, UBxLBy)],
  [Negative], [Positive], [Positive], [Positive],
  [(LBxUBy, UBxUBy)],
  [Negative], [Positive], [Negative], [Negative],
  [(UBxLBy, LBxLBy)],
  [Negative], [Positive], [Negative], [Positive],
  [(min(UBxLBy, LBxUBy), max(LBxLBy, UBxUBy))]
)

