__author__ = 'davidyurek'
__question = 'De-columnize a block of text, extracting the text, removing the features, and dehyphenating multiline words.'

class Decolumnizer
  attr_reader :paragraphs

  def initialize text
    @paragraphs = get_paragraphs text
  end

  private

  def get_paragraphs text
    lines_array = text.split("\n")
    lines_array = lines_array.map{ |line| remove_features line }.map(&:strip)
    lines_array.map! { |line| line == '' ? "\n\n" : line }
    lines_array = lines_array.map{ |line| line != "\n\n" ? dehyphenate(line) : line }
    return lines_array.join('')
  end

  def dehyphenate line
    if line[-1] == '-'
      return line[0..-2]
    else
      return line + ' '
    end
  end

  def remove_features line
    line.gsub(/\s*(\|.*(?=[|+])|\+-*(?=\+))+.\s*/, '')
  end
end

if __FILE__ == $0
  dc =  Decolumnizer.new($stdin.read)
  puts dc.paragraphs
end