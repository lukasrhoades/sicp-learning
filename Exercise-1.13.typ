#import "@preview/trivial:0.1.0"
#show: trivial.init
#let numbered-theorem = trivial.theorem.with(
  "theorem",
  trivial.styles.theorem.default,
  numbering: "1",
)
#let definition = numbered-theorem.with([Definition])
#let theorem = numbered-theorem.with([Theorem])
#let lemma = numbered-theorem.with([Lemma])
#let remark = numbered-theorem.with([Remark])
#let corollary = numbered-theorem.with([Corollary])
#let proof = trivial.proof.with(
  [Proof],
  trivial.styles.proof.default,
  qed: $square.stroked$,
)

#definition[
  The Fibonnaci numbers are defined as the following.
  $
    "Fib"(n) := cases(
      0 "if" n = 0,
      1 "if" n = 1,
      "Fib"(n-1) + "Fib"(n-2) "otherwise."
    )
  $
]<def>

#theorem(name: "Closest Integer")[
  Fib($n$) is the closest integer to $phi^n/sqrt(5)$, where $phi = (1 + sqrt(5))/2$.
]<thm>
#proof[
  Let $psi = (1 - sqrt(5))/2$. We will prove @thm by first showing @lemma1 
  and then using @lemma3 to show that $psi^n/sqrt(5)$ is small enough such that
  Fib($n$) is the closest integer to $phi^n/sqrt(5)$.
  #lemma[
    Fib($n$) = $(phi^n - psi^n)/sqrt(5)$.
  ]<lemma1>
  #proof[
    By strong induction. The induction hypothesis $P(n)$, will be @lemma1.

    *Base case:* Fib($n$) = 0, by @def.
    $P(0) = (phi^0 - psi^0)/sqrt(5) = (1-1)/sqrt(5) = 0/sqrt(5) = 0.$

    *Inductive step:* Assume $forall m in Z^+, m<=n, P(m)$ and show that $P(n+1)$. #linebreak()
    Fib($n+1$) $=$ Fib($n$) $+$ Fib($n-1$), by @def. #linebreak()
    By the strong induction hypothesis, we know that Fib($n$) $= (phi^n - psi^n)/sqrt(5)$
    and Fib($n-1$) $= (phi^(n-1) - psi^(n-1))/sqrt(5)$.
    Fib($n+1$) $= (phi^n - psi^n)/sqrt(5) + (phi^(n-1) - psi^(n-1))/sqrt(5)
    = (phi^(n-1) + phi^n - psi^(n-1) - psi^n)/sqrt(5) = (phi^(n-1)(1 + phi)
    - psi^(n-1)(1 + psi))/sqrt(5)$.
    #remark[
      $phi$ is defined by the _golden ratio_, $phi^2 = phi + 1$.
      Similarily, we can show that $psi^2 = psi + 1$.
    ]
    #lemma[
      $phi^2 = phi + 1$ and $psi^2 = psi + 1$. 
      #proof[
        The former is given by the text. The latter is shown by direct proof. #linebreak()
        $psi^2 = ((1-sqrt(5))/2)^2 = (1 - 2sqrt(5) + 5)/4
        = (6 - 2sqrt(5))/4 = (3 - sqrt(5))/2 = (1 - sqrt(5) + 2)/2
        = (1 - sqrt(5))/2 + 1 = psi + 1$.
      ]
    ]<lemma2>
    By @lemma2, we can simplify Fib($n+1$) to $(phi^(n-1)(phi^2) -
    psi^(n-1)(psi^2))/sqrt(5) = (phi^(n+1) - psi^(n+1))/sqrt(5) = P(n+1).$
  ]
  By @lemma1, Fib($n$) = $phi^n/sqrt(5) - psi^n/sqrt(5)$. We can rewrite
  this as $phi^n/sqrt(5) =$ Fib($n$) $+ psi^n/sqrt(5)$. #linebreak()
  Now, we can show @thm by proving @lemma3.
  #lemma[
    $|psi^n/sqrt(5)| < 1/2, forall n in Z^+$.
  ]<lemma3>
  #proof[
    First, we show the absolute value of the numerator is less than 1.
    #lemma[
      $|psi^n| < 1, forall n in Z^+$.
    ]<lemma4>
    #proof[
      $|(1-sqrt(5))/2| = |-(sqrt(5)-1)/2| = (sqrt(5)-1)/2$.
      If $sqrt(5) - 1 < 2, "then" (sqrt(5)-1)/2 < 1$.
      $sqrt(5) < 3 arrow.l.r.double.long sqrt(5) < sqrt(9)$,
      therefore $(sqrt(5)-1)/2 < 1$ and $|psi^n| < 1$.
    ]
    By @lemma4, $|psi^n/sqrt(5)| < 1/sqrt(5) < 1/2 arrow.l.r.double.long
    sqrt(5) > 2 arrow.l.r.double.long sqrt(5) > sqrt(4)$.
  ]
  #remark[
    Because $psi^n < 1$, as $n->infinity$, $psi^n->0$.
  ]
  By @lemma3, $forall n in Z^+, phi^n/sqrt(5)$ is the closest integer
  to $(phi^n - psi^n)/sqrt(5)$.
  By @lemma1, that is the closest integer to Fib($n$).
]
