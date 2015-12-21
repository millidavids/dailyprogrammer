#!/usr/bin/env python3

import sys, re

def dateDilemma(string):
  r = re.compile(r'\d+')
  return r.findall(string)

if __name__ == '__main__':
  dates = sys.stdin.read().strip().split('\n')
  print([dateDilemma(x) for x in dates], sep='\n')
