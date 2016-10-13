#! /usr/bin/env python

value = 40
rate = 1.08
fix = 0.0021
old = value

for i in xrange (26):
  print i, value, float (value) / float (old)
  old = value
  value = int ((value * (rate + (i * fix))) + 0.5)
