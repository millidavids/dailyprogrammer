#!/usr/bin/ruby

class CellularAutomata
  attr_reader :initial_array

  def initialize line
    @initial_array = line.split('')
  end

  def output_automata_steps steps
    automata_array = @initial_array.map{ |item| item == 1 ? 'x' : ' '}
    steps.to_i.times do |step|
    end
  end
end

if __FILE__ == $0
  input = ARGV[0]
  ca = CellularAutomata.new(input)
end