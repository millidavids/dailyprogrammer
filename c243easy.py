#!/usr/bin/env python

import sys
import math
 
def deficiencyCheck(n):
  result = sum([x+n/x for x in range(1,int(math.ceil(math.sqrt(n)))) if n%x==0])-2*n
  if result > 0:
    return '{0} is Abundant by {1}'.format(n, result)
  elif result == 0:
    return '{0} is Perfect'.format(n)
  else:
    return '{0} is Deficient by {1}'.format(n, result)

if __name__ == '__main__':
  inputs = [int(x) for x in sys.stdin.read().strip().split("\n")]
  for x in inputs:
    print deficiencyCheck(x)
