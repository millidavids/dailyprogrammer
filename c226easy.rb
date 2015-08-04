class Fractions
  def self.add *fractions
    pairs = fractions.map{ |item| item.split("/").map{ |char| char.to_i } }
    lcm = pairs.map{ |pair| pair[1] }.reduce(:lcm)
    numerator_total = pairs.map{ |pair| pair[0] * (lcm/pair[1])}.inject(:+)
    gcd = lcm.gcd(numerator_total)
    return (numerator_total/gcd).to_s + '/' + (lcm/gcd).to_s unless gcd == lcm
    return (numerator_total/gcd)
  end
end

if __FILE__ == $0
  puts Fractions.add(*$stdin.read.split("\n"))
end