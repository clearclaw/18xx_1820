#! /usr/bin/env python

value = 40
rate = 1.08
fix = 0.0021
old = value

for i in xrange (26):
  print "#%2d" % i, "Value: %3d" % value, "Gain: %f" % (float (value) / float (old))
  old = value
  value = int ((value * (rate + (i * fix))) + 0.5)
