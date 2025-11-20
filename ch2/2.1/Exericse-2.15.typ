As seen in Exercise 2.14, $A / A$ does not return precisely 1, 
which algebraically would be the reduction of something divided 
by itself. This is because the way we defined `div-interval` 
will magnify uncertainty that is present in an interval, even
if the intervals are equivalent. So it is not the same
as performing a division by itself that you would expect. 
Only when the interval has no width, which is the case for 
the `one` interval in `par2`, will uncertainty not be compounded 
by an interval operation. This also explains the first part
of Exercise 2.16, the latter of which will not be attempted.
The task to eliminate this seems difficult because intervals
themselves represent a range of values, so two identical intervals
could contain different values, which is why error bounds increase
when repeated operations occur.

In a way Eva is right, because the second method only makes
calculations with uncertain numbers once, when adding the
two intervals in the denominator, which will produce a 
tighter error bound. Whether that is "better" or not depends
on how much error the user wants.
