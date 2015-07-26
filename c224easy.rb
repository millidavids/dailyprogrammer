__author__ = 'davidyurek'
__question__ = "We've had our fair share of sorting algorithms, now let's do a shuffling challenge. In this challenge, your challenge is to take a list of inputs and change around the order in random ways. Think about shuffling cards - can your program shuffle cards?"

print ARGV.length.times.map { ARGV.delete_at(rand(ARGV.length))}