#!/usr/bin/env python3

import sys, re

def dateDilemma(string):
  r = re.compile(r'\d+')
  split_string = ['0' + x if len(x) == 1 else x for x in r.findall(string)]
  if len(split_string[0]) == 4:
    return '-'.join(split_string)
  else:
    return '-'.join(['20' + split_string[2] if len(split_string[2]) == 2 else split_string[2]] + split_string[:2])

if __name__ == '__main__':
  dates = sys.stdin.read().strip().split('\n')
  print('\n')
  print(*[dateDilemma(x) for x in dates], sep='\n')
