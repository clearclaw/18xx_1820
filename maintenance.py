#! /usr/bin/env python

value = 20
rate = 1.5

for i in xrange (26):
  print i, value
  value = int ((value * (rate)) + 0.5)