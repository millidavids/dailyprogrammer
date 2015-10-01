require 'JSON'

def json_hunt string
  json = JSON.parse(string)
end

if __FILE__ == $0
  input = $stdin.read
  puts json_hunt(input)
end