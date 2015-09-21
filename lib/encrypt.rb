class Encrypt
  attr_reader :input,
              :date,
              :key

  def initialize(key = 12345, input = "Thanks")
    @key = key
    @date = Time.now.strftime("%d%m%y").to_i
    @input = input
  end

  def key_generator
    @key = 5.times.map { ('0'..'9').to_a.sample }.join
  end

  def key_rotation(wheel)
    @key.to_s[wheel-1..wheel].to_i
  end

  def offset(wheel)
    square_the_date = @date * @date
    square_the_date.to_s[wheel-5].to_i
  end

  def full_rotation(wheel)
    key_rotation(wheel) + offset(wheel)
  end

  def character_map
    character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
      "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6",
      "7", "8", "9", " ", ".", ","]
  end

  def downcase_string
    input.downcase
  end

  def chars_string
    downcase_string.chars
  end

  def encryption
    chars_string.map!.with_index do |char, index|
      if index % 4 == 0
        rotation = character_map.index("#{char}") + full_rotation(1)
        new_char = character_map.rotate(rotation).shift
        char = new_char
      elsif index % 4 == 1
        rotation = character_map.index("#{char}") + full_rotation(2)
        new_char = character_map.rotate(rotation).shift
        char = new_char
      elsif index % 4 == 2
        rotation = character_map.index("#{char}") + full_rotation(3)
        new_char = character_map.rotate(rotation).shift
        char = new_char
      else index % 4 == 3
        rotation = character_map.index("#{char}") + full_rotation(4)
        new_char = character_map.rotate(rotation).shift
        char = new_char
      end
    end
  end

  def join_chars_string
    encryption.join
  end

end

if __FILE__==$0
  input_string = File.read(ARGV[0])
  key = 5.times.map { ('0'..'9').to_a.sample }.join
  output_file = File.open(ARGV[1], "w")
  output_string = Encrypt.new(key, "#{input_string}").join_chars_string
  output_file.write(output_string)
  date = Time.now.strftime("%d%m%y")
  puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
end
