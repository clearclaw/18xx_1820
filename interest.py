#! /usr/bin/env python

value = 40
rate = 1.08
fix = 0.0021

for i in xrange (26):
  print i, value
  value = int ((value * (rate + (i * fix))) + 0.5)