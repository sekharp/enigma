class Cracked
  attr_reader :input,  # => :input
              :date,   # => :date
              :key     # => nil

  def initialize(input = ",6 y3e")
    @key = key                                # => nil
    @date = Time.now.strftime("%d%m%y").to_i  # => 160915
    @input = input                            # => ",6 y3e"
  end                                         # => :initialize

  def crack_key
    correction = @input.length % 4
    encrypted_char = @input[-4-correction] # char is a rotation from .
    full_rotation(1) = character_map.index("#{encrypted_char}") - rotation
  end                               # => :crack_key

  def chars_string
    input.chars
  end               # => :chars_string

  def key_rotation(wheel)
    @key.to_s[wheel-1..wheel].to_i
  end                               # => :key_rotation

  def square_the_date
    square_of_date = @date * @date
  end                               # => :square_the_date

  def offset(wheel)
    offset = square_the_date.to_s[wheel-5].to_i
  end                                            # => :offset

  def full_rotation(wheel)
    full_rotation = key_rotation(wheel) + offset(wheel)
  end                                                    # => :full_rotation

  def character_map
    character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
      "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6",
      "7", "8", "9", " ", ".", ","]
  end                                                              # => :character_map

  def decryption
    chars_string.map!.with_index do |char, index|
      if index % 4 == 0
        rotation = character_map.index("#{char}") - full_rotation(1)
        new_char = character_map.rotate(rotation).shift
        char = new_char
      elsif index % 4 == 1
        rotation = character_map.index("#{char}") - full_rotation(2)
        new_char = character_map.rotate(rotation).shift
        char = new_char
      elsif index % 4 == 2
        rotation = character_map.index("#{char}") - full_rotation(3)
        new_char = character_map.rotate(rotation).shift
        char = new_char
      else index % 4 == 3
        rotation = character_map.index("#{char}") - full_rotation(4)
        new_char = character_map.rotate(rotation).shift
        char = new_char
      end
    end
  end                                                                 # => :decryption

  def join_chars_string
    decryption.join
  end                    # => :join_chars_string

end  # => :join_chars_string

Cracked.new(",6 y3e").input[-6]  # => ","

if __FILE__==$0                                                                # => true
  input_string = File.read(ARGV[0])                                            # ~> TypeError: no implicit conversion of nil into String
  key = key
  output_file = File.open(ARGV[1], "w")
  output_string = Cracked.new(key, "#{input_string}").join_chars_string
  output_file.write(output_string)
  date = Time.now.strftime("%d%m%y")
  puts "Created '#{ARGV[1]}' with the cracked key #{key} and date #{ARGV[2]}"
end

# ~> TypeError
# ~> no implicit conversion of nil into String
# ~>
# ~> /Users/sekharpaladugu/code/projects/enigma/lib/crack.rb:75:in `read'
# ~> /Users/sekharpaladugu/code/projects/enigma/lib/crack.rb:75:in `<main>'
