#!/usr/bin/env python
key = [503, 87,512, 61,908,170,897,275,
       653,426,154,509,612,677,765,703]
n = len(key)
count = []
while len(count) < n:              # C1. [Clear COUNTs]
    count.append(0)
for i in range(n - 1, 0, -1):      # C2. [Loop on i]
    for j in range(i - 1, -1, -1): # C3. [Loop on j]
        if (key[i] < key[j]):      # C4. [Compare Ki:Kj]
            count[j] += 1
        else:
            count[i] += 1
# spit
for j in range(0, n):
    print j, '\t', count[j], '\t', key[j]
