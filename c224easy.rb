__author__ = 'davidyurek'
__question__ = "We've had our fair share of sorting algorithms, now let's do a shuffling challenge. In this challenge, your challenge is to take a list of inputs and change around the order in random ways. Think about shuffling cards - can your program shuffle cards?"

shuffled = []
ARGV.each { |a| (rand(10).even?) ? shuffled.unshift(a) : shuffled.push(a) }
shuffled.each { |item| print item.to_s + ' '}