class Encrypt

end

if __FILE__==$0
  input_string = File.open(ARGV[0]).read
  key = 33333
  date = 111111
  output_file = File.open(ARGV[1], "w")
  output_string = "Hello"
  output_file.write(output_string)
  puts "Created '#{ARGV[1]}' with the key #{key} and date #{date}"
end
