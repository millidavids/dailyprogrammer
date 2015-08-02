__question__ = "Today, we're going to honor those mathematicians of old. You will be given an image of a black circle on white background, and using the pixel data in the image, you are to come up with an estimate for pi."

require 'chunky_png'

class EstimatePi
  attr_reader :filename, :image_width, :image_height

  @@equation = ->(m, n) { (4.0 * m) / n }

  def initialize filename
    @filename = filename
    @image = ChunkyPNG::Image.from_file(filename)
    @image_width = @image.dimension.width
    @image_height = @image.dimension.height
  end

  def pi_estimation_from_interations iterations
    m = 0
    iterations.times do |iteration|
      randx = rand(@image_width)
      randy = rand(@image_height)
      red = ChunkyPNG::Color.r(@image[randx, randy])
      green = ChunkyPNG::Color.g(@image[randx, randy])
      blue = ChunkyPNG::Color.b(@image[randx, randy])
      color = ChunkyPNG::Color.rgb(red, green, blue)
      if color == ChunkyPNG::Color(:black)
        m += 1
      end
    end
    return @@equation.call(m, iterations)
  end
end

if __FILE__ == $0
  estimate = EstimatePi.new('./res/1000x1000circle.png')
  iterations = $stdin.read.split("\n")[0].strip.to_i
  puts estimate.pi_estimation_from_interations iterations
end