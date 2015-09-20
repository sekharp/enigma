class Cracked
  attr_reader :date,
              :input

  def initialize(input = ",6 y3e8jx,ajr")
    @date = Time.now.strftime("%d%m%y").to_i
    @input = input
  end

  def character_map
    character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
      "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6",
      "7", "8", "9", " ", ".", ","]
  end

  def crack_key_full_rotation(wheel)
    correction = @input.length % 4
    encrypted_char = @input[wheel-correction]
    decrypted_end = "..end.."
    decrypted_char = decrypted_end[wheel-correction]
    full_rotation = character_map.index("#{encrypted_char}") - character_map.index("#{decrypted_char}")
    key_rotation = full_rotation % 39
  end

  def decryption
    @input.chars.map!.with_index do |char, index|
      if index % 4 == 0
        rotation = character_map.index("#{char}") - crack_key_full_rotation(-4)
        new_char = character_map.rotate(rotation).shift
        char = new_char
      elsif index % 4 == 1
        rotation = character_map.index("#{char}") - crack_key_full_rotation(-3)
        new_char = character_map.rotate(rotation).shift
        char = new_char
      elsif index % 4 == 2
        rotation = character_map.index("#{char}") - crack_key_full_rotation(-2)
        new_char = character_map.rotate(rotation).shift
        char = new_char
      else index % 4 == 3
        rotation = character_map.index("#{char}") - crack_key_full_rotation(-1)
        new_char = character_map.rotate(rotation).shift
        char = new_char
      end
    end
  end

  def join_chars_string
   decryption.join
  end
end

if __FILE__==$0
  input_string = File.read(ARGV[0])
  output_file = File.open(ARGV[1], "w")
  output_string = Cracked.new("#{input_string}").join_chars_string
  output_file.write(output_string)
  date = Time.now.strftime("%d%m%y")
  puts "Created '#{ARGV[1]}' with no key or date needed!"
end
