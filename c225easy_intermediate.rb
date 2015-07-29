__author__ = 'davidyurek'
__question = 'De-columnize a block of text, extracting the text, removing the features, and dehyphenating multiline words.'

class Decolumnizer
  attr_reader :paragraphs, :features_and_paragraphs

  def initialize text
    @paragraphs = get_paragraphs text
    # @paragraphs = get_paragraphs(text)
    # @features_and_paragraphs = get_features_and_paragraphs(text)
  end

  private

  def get_paragraphs text
    lines_array = text.split("\n")
    lines_array = lines_array.map{ |line| remove_features line }.map(&:strip)
    lines_array.map! { |line| line == '' ? "\n\n" : line }
    lines_array = lines_array.map{ |line| line != "\n\n" ? dehyphenate(line) : line }
    return lines_array.join('')
  end

  def get_features_and_paragraphs text
    nil
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

  def get_feature_strings text
    nil
  end
end

if __FILE__ == $0
  dc =  Decolumnizer.new($stdin.read)
  puts dc.paragraphs
  # puts "\n"
  # puts dc.features_and_paragraphs
end