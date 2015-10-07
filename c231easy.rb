#!/usr/bin/ruby

class CellularAutomata
  attr_reader :initial_array

  def initialize line
    @initial_array = line.split('').map(&:to_i)
  end

  def output_automata_steps steps
    automata_array = @initial_array
    result_string = automata_array.map{ |item| item == 1 ? 'x' : ' '}.join + "\n"
    steps.times do
      automata_array = automata_array.map.with_index do |_, i|
        if (i == 0 ? 0 : automata_array[i - 1]) != 
           (i == automata_array.length - 1 ? 0 : automata_array[i + 1])
          1
        else
          0
        end
      end
      result_string << automata_array.map{ |item| item == 1 ? 'x' : ' '}.join + "\n"
    end
    return result_string
  end
end

if __FILE__ == $0
  input = ARGV[0]
  ca = CellularAutomata.new(input)
  puts ca.output_automata_steps(10000)
end