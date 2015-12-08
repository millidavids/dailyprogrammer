#!/usr/bin/env python

def weeksBeforeFed(people, fruits):
  fruits_array = [fruits]
  week = 2
  while sum(fruits_array) < people:
    harvest = [1 for x in range(sum(fruits_array))]
    fruits_array = [x+1 for x in fruits_array] + harvest
    week += 1
  return week

if __name__ == '__main__':
  inputs = raw_input('Enter number of people and number of fruit (space separated): ')
  people, fruits = [int(x) for x in inputs.split(' ')]
  print weeksBeforeFed(people, fruits)
