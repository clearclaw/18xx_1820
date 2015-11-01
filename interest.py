#! /usr/bin/env python

value = 39
rate = 1.08

for _ in xrange (34):
  print value
  value = int ((value * rate) + 0.5)
    