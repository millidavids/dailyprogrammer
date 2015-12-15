#!/usr/bin/env python

def gameOfThrees(num):
  while num != 1:
    mod = num % 3
    if mod == 0:
      num /= 3
    elif mod == 1:
      num = (num - 1) / 3
    else:
      num = (num + 1) / 3
    print num

if __name__ == '__main__':
  num = int(raw_input('Number for game of threes: '))
  gameOfThrees(num)
