class Encrypt
  def initialize
    @key = rand(10000..99999)
  end

  def key_generator
    a = @key.to_s[0..1]
    b = @key.to_s[1..2]
    c = @key.to_s[2..3]
    d = @key.to_s[3..4]
    array = [a, b, c, d]
  end

  def offset
    date = Time.now.strftime("%d%m%y").to_i
    square_of_date = date * date
    a_offset = square_of_date.to_s[-4]
    b_offset = square_of_date.to_s[-3]
    c_offset = square_of_date.to_s[-2]
    d_offset = square_of_date.to_s[-1]
  end

  def character_map
    character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u"
      "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6"
      "7", "8", "9", " ", ".", ","]
  end
end

Encrypt.new.key_generator
Encrypt.new.offset

if __FILE__==$0
  def date(date)
    date.strftime("%d%m%y")
  end

  input_string = File.open(ARGV[0]).read
  key = rand(10000..99999)
  output_file = File.open(ARGV[1], "w")
  output_string = "Hello"
  output_file.write(output_string)
  date = Time.now.strftime("%d%m%y")
  puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
end
