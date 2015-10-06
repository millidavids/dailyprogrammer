#!/usr/bin/ruby

class CellularAutomata
  attr_reader :initial_array

  def initialize line
    @initial_array = line.split('')
  end

  def output_automata_steps steps
    automata_array = @initial_array
    build_array = []
    result_string = automata_array.map{ |item| item == 1 ? 'x' : ' ' }.join('')
    steps.to_i.times do
      automata_array.length.times do |index|
        if index == 0 && automata_array[index + 1].to_i == 0
          build_array << 0
          result_string 
        end
      end
    end
    puts build_array.to_s
  end
end

if __FILE__ == $0
  input = ARGV[0]
  ca = CellularAutomata.new(input).output_automata_steps(25)
end