require 'JSON'

class JSONHunt
  def initialize string
    @json = JSON.parse(string)
  end

  def get_path item
    path=[]
    recursive_path_search item, path
    return path.reverse
  end

  private

  def recursive_path_search item, path, key='', obj=@json
    case obj
    when Hash
      obj.each do |key, value|
        path.unshift(key)
        path.unshift(' > ')
        recursive_path_search item, path, key, value
        break if path.first == item
        path.shift(2)
      end
    when Array
      obj.each_with_index do |value, index|
        path.unshift(index)
        path.unshift(' > ')
        recursive_path_search item, path, index, value
        break if path.first == item
        path.shift(2)
      end
    else
      if obj == item
        path.unshift(obj)
      end
    end
  end
end

if __FILE__ == $0
  input = $stdin.read
  puts JSONHunt.new(input).get_path('dailyprogrammer').to_s
end