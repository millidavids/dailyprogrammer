__author__ = 'davidyurek'
__question__ = "A garland word[1] is one that starts and ends with the same N letters in the same order, for some N greater than 0, but less than the length of the word. I'll call the maximum N for which this works the garland word's degree."

puts ARGV.map{|a|(a.length-1).times.map{|i|(a.split('')[0..i]==a.split('')[(-1*i-1)..(a.length-1)])?i+1:next}.reject{|e|e==nil}[-1]}