#! /usr/bin/env python

value = 38
rate = 1.08
fix = 0.0005

for i in xrange (37):
  print i, value
  value = int ((value * (rate + (i * fix))) + 0.5)
    