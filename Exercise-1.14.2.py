#!/usr/bin/env python3

def count_change(amt, noc):
    def cc(amt, koc):
        if ((amt <= 0) or (koc == 0)):
            return 1
        else:
            return cc(amt, (koc - 1)) + cc((amt - fd(koc)), koc) + 1
    def fd(koc):
        if koc == 1:
            return 1
        elif koc == 2:
            return 5
        elif koc == 3:
            return 10
        elif koc == 4:
            return 25
        elif koc == 5:
            return 50
    return cc(amt, noc)

for i in range(1, 6):
    print(f"number of steps for each amount for {i} coin(s)")
    for j in range(1, 101):
        print(count_change(j, i), end=",")
    print("\n")
