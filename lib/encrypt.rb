class Encrypt
  attr_reader :input,
              :date

  def initialize(key, input = "Thanks")
    @key = key
    @date = Time.now.strftime("%d%m%y").to_i
    @input = input
  end

  def key_generator
    @key = 5.times.map { ('0'..'9').to_a.sample }.join
  end

  def key_a_rotation
    a = @key.to_s[0..1].to_i
  end

  def key_b_rotation
    b = @key.to_s[1..2].to_i
  end

  def key_c_rotation
    c = @key.to_s[2..3].to_i
  end

  def key_d_rotation
    d = @key.to_s[3..4].to_i
  end

  def square_the_date
    square_of_date = @date * @date
  end

  def a_offset
    a_offset = square_the_date.to_s[-4].to_i
  end

  def b_offset
    b_offset = square_the_date.to_s[-3].to_i
  end

  def c_offset
    c_offset = square_the_date.to_s[-2].to_i
  end

  def d_offset
    d_offset = square_the_date.to_s[-1].to_i
  end

  def character_map
    character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
      "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6",
      "7", "8", "9", " ", ".", ","]
  end

  def downcase_string
    downcase_string = input.downcase
  end

  def chars_string
    chars_array = downcase_string.chars
  end

  def iteration
    chars_string.map!.with_index do |char, index|
      if index == 0
        char = "q"
      else
        char
      end
    end
  end

  # iterate over elements based on index modulo 4 == 0/1/2/3
  # rotate by key of a rotation plus a offset or ...
  # where rotate involves first pulling the index of the
  # element in the character map and adding the rotation offset
  # and rotating the character map by that full amount then
  # using shift on the character map array to return encrypted
  # character which we then map onto the input string array
  # array.join at again

end

if __FILE__==$0
  def date(date)
    date.strftime("%d%m%y")
  end

  input_string = File.open(ARGV[0]).read
  key = 5.times.map { ('0'..'9').to_a.sample }.join
  output_file = File.open(ARGV[1], "w")
  output_string = "Hello"
  output_file.write(output_string)
  date = Time.now.strftime("%d%m%y")
  puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
end
