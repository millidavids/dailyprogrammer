def dottie_number input
  dottie = Math.cos(input)
  puts dottie
  until dottie.round(15) == Math.cos(dottie).round(15)
    dottie = Math.cos(dottie)
    puts dottie
  end
end

if __FILE__ == $0
  print 'Input number: '
  number = gets.chomp.to_i
  dottie_number number
end