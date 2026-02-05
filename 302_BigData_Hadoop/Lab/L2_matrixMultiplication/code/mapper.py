#!/usr/bin/env python3
import sys

for line in sys.stdin:
    line = line.strip()
    matrix, i, j, value = line.split(',')
    i = int(i)
    j = int(j)
    value = int(value)

    # Matrix A
    if matrix == 'A':
        for k in range(2):     # number of columns of B
            print(f"{i},{k}\tA,{j},{value}")

    # Matrix B
    else:
        for k in range(2):     # number of rows of A
            print(f"{k},{j}\tB,{i},{value}")
