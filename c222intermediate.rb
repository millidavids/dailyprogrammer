class LCGEncryption
  attr_reader :seed

  def initialize seed
    @seed = seed
    @a = 1103515245
    @c = 12345
    @m = 2^32
    @x = seed % @m
  end

  def enc_dec text
    text_array = []

    text.split('').each do |char|
      text_array << (char.ord ^ next_iteration).chr
    end

    return text_array.join('')
  end

  private

  def next_iteration
    @x = (@a * @x + @c) % @m
  end
end

if __FILE__ == $0
  msg = 'Attack at dawn.'
  puts 'Message: ' + msg
  cipher = LCGEncryption.new(31337)
  ciphertext = cipher.enc_dec(msg)
  puts 'Ciphertext: ' + ciphertext
  decipher = LCGEncryption.new(cipher.seed)
  decrypted_message = decipher.enc_dec(ciphertext)
  puts 'Decrypted message: ' + decrypted_message
end