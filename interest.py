#! /usr/bin/env python

value1 = 40
value2 = 40
value3 = 40
rate1 = 1.08
rate2 = 1.08
rate3 = 1.08
fix1 = 0.0021
fix2 = 0.00178
fix3 = 0.00188
limit = 26
limit = 30
p = 0

for i in xrange (limit):
  print i, value1, value3, p
  value1 = int ((value1 * (rate1 + (i * fix1))) + 0.5)
  value2 = int ((value2 * (rate2 + (i * fix2))) + 0.5)
  p = (rate3 + (i * (fix1 if value3 < 128 else fix2)))
  value3 = int ((value3 * (rate3 + (i * (fix1 if value3 < 128 else fix2)))) + 0.5)
  