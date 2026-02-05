#!/usr/bin/env python3
import sys

current_key = None
values = []

def compute(key, values):
    A = {}
    B = {}

    for v in values:
        matrix, index, val = v.split(',')
        index = int(index)
        val = int(val)

        if matrix == 'A':
            A[index] = val
        else:
            B[index] = val

    result = 0
    for k in A:
        if k in B:
            result += A[k] * B[k]

    print(f"{key}\t{result}")

for line in sys.stdin:
    key, value = line.strip().split('\t')

    if key != current_key and current_key is not None:
        compute(current_key, values)
        values = []

    current_key = key
    values.append(value)

if current_key is not None:
    compute(current_key, values)
