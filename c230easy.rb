require 'JSON'

class JSONHunt
  def initialize string
    @json = JSON.parse(string)
  end

  def get_path
  end
end

if __FILE__ == $0
  input = $stdin.read
  puts JSONHunt.new(input).get_path
end