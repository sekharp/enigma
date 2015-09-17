require 'pry'
class Cracked
  attr_reader :input,
              :date,
              :key

  def initialize(input = ",6 y3e8jx,ajr")
    @key = key
    @date = Time.now.strftime("%d%m%y").to_i
    @input = input
  end

  def character_map
    character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
      "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6",
      "7", "8", "9", " ", ".", ","]
  end

  def crack_key_a_full_rotation
    correction = @input.length % 4
    encrypted_char_a = @input[-4-correction] # "x"
    decrypted_end = "..end.."
    decrypted_char_a = decrypted_end[-4-correction] # "e"
    character_map.index("#{encrypted_char_a}") # 23
    character_map.index("#{decrypted_char_a}") # 4
    full_rotation_a = character_map.index("#{encrypted_char_a}") - character_map.index("#{decrypted_char_a}")
  end

  def square_the_date
    @date * @date
  end

  def offset_a
    square_the_date.to_s[-4].to_i
  end

  def key_rotation_a
    key_rotation_a = crack_key_a_full_rotation - offset_a
    binding.pry
  end

end

# Cracked.new(",6 y3e8jx,ajr").input[-5]
# Cracked.ack_key  # => "x"

# "thanks..end.."
# e maps to x - a rotation
# n maps to , - b rotation
# d maps to a - c rotation
# . maps to j - d rotation
# use math in decryption to solve for rotation amount between x and e,
# then calculation full rotation for a, then use date to get offsets and get original key
#
# if __FILE__==$0
#   input_string = File.read(ARGV[0])
#   key = key
#   output_file = File.open(ARGV[1], "w")
#   output_string = Cracked.new(key, "#{input_string}").join_chars_string
#   output_file.write(output_string)
#   date = Time.now.strftime("%d%m%y")
#   puts "Created '#{ARGV[1]}' with the cracked key #{key} and date #{ARGV[2]}"
# end
