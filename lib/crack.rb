require 'pry'
class Cracked
  attr_reader :input,
              :date

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

  def crack_key_a_full_rotation
    correction = @input.length % 4
    encrypted_char_a = @input[-4-correction]
    decrypted_end = "..end.."
    decrypted_char_a = decrypted_end[-4-correction]
    full_rotation_a = character_map.index("#{encrypted_char_a}") - character_map.index("#{decrypted_char_a}")
  end

  def key_rotation_a
    key_rotation_a = crack_key_a_full_rotation % 39
  end

  def crack_key_b_full_rotation
    correction = @input.length % 4
    encrypted_char_b = @input[-3-correction]
    decrypted_end = "..end.."
    decrypted_char_b = decrypted_end[-3-correction]
    full_rotation_b = character_map.index("#{encrypted_char_b}") - character_map.index("#{decrypted_char_b}")
  end

  def key_rotation_b
    key_rotation_b = crack_key_b_full_rotation % 39
  end

  def crack_key_c_full_rotation
    correction = @input.length % 4
    encrypted_char_c = @input[-2-correction]
    decrypted_end = "..end.."
    decrypted_char_c = decrypted_end[-2-correction]
    full_rotation_c = character_map.index("#{encrypted_char_c}") - character_map.index("#{decrypted_char_c}")
  end

  def key_rotation_c
    key_rotation_c = crack_key_c_full_rotation  % 39
  end

  def crack_key_d_full_rotation
    correction = @input.length % 4
    encrypted_char_d = @input[-1-correction]
    decrypted_end = "..end.."
    decrypted_char_d = decrypted_end[-1-correction]
    full_rotation_d = character_map.index("#{encrypted_char_d}") - character_map.index("#{decrypted_char_d}")
    end

  def key_rotation_d
    key_rotation_d = crack_key_d_full_rotation  % 39
  end

  def decryption
    @input.chars.map!.with_index do |char, index|
      if index % 4 == 0
        rotation = character_map.index("#{char}") - key_rotation_a
        new_char = character_map.rotate(rotation).shift
        char = new_char
      elsif index % 4 == 1
        rotation = character_map.index("#{char}") - key_rotation_b
        new_char = character_map.rotate(rotation).shift
        char = new_char
      elsif index % 4 == 2
        rotation = character_map.index("#{char}") - key_rotation_c
        new_char = character_map.rotate(rotation).shift
        char = new_char
      else index % 4 == 3
        rotation = character_map.index("#{char}") - key_rotation_d
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
  key = 99999
  output_file = File.open(ARGV[1], "w")
  output_string = Cracked.new("#{input_string}").join_chars_string
  output_file.write(output_string)
  date = Time.now.strftime("%d%m%y")
  puts "Created '#{ARGV[1]}' with the cracked key #{key} and date"
end
