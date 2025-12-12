The order of growth of the number of steps needed to encode
the most frequent symbol in the alphabet described in
Exercise 2.71, where the relative frequencies of symbols
are $2^n$ where $n$ starts at 0, is $Theta(1)$. This is because
the most frequent symbol is always a leaf node that is a child
of the root node, which means the number of steps to traverse
the tree from root to leaf will be the same no matter the size
of $n$ (number of total leaf nodes in tree).

The order of growth of the number of stepts to encode the least
frequent symbol is $Theta(n^2)$.
The number of steps to check whether the symbol is in each node
(`choose-branch`, which calls `element-of-set?`) is roughly $n$
where $n$ is the number of symbols in said node. Starting from the 
root node and traversing the tree to reach the least frequent symbol,
the `element-of-set?` procedure is called once on a branch with
$n-k$ symbols where $k$ is the level of the tree, which requires 
$n-k$ many steps, and once on a leaf node which always requires 
only 1 step. Incrementing $n$ by one yields another level with $n$
many steps. The total number of steps involved with `choose-branch`
thus grows as $n^2$ because there will be $n$ many levels where
`element-of-set?` invokes up to $n$ many steps.
