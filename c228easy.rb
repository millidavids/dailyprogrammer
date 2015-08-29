def word_letters_in_alphabetical_order char_array
  char_array.each_with_index do |char, index|
    if index > 0
      if char >= char_array[index - 1]
        next
      else
        return char_array.join('') + ' NOT IN ORDER'
      end
    else
      next
    end
  end

   return char_array.join('') + ' IN ORDER'
end

def word_letters_in_reverse_alphabetical_order char_array
  char_array.each_with_index do |char, index|
    if index > 0
      if char <= char_array[index - 1]
        next
      else
        return char_array.join('') + ' NOT IN ORDER'
      end
    else
      next
    end
  end
  return char_array.join('') + ' REVERSE ORDER'
end

def letter_order word
  char_array = word.downcase.split('')
  if char_array[0] < char_array[1]
    return word_letters_in_alphabetical_order char_array
  else
    return word_letters_in_reverse_alphabetical_order char_array
  end
end

if __FILE__ == $0
  word_array = $stdin.read.split("\n").map(&:strip)
  word_array.each { |word| puts letter_order word }
end