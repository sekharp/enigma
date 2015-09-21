gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack'

class CrackedTest < Minitest::Test

  def test_that_program_initializes_todays_date_and_input_string
    cracked = Cracked.new(",6 y338jx,ajr")

    assert_equal 210915, cracked.date
    assert_equal ",6 y338jx,ajr", cracked.input
  end

  def test_that_program_initializes_todays_date_and_different_input_string
    cracked = Cracked.new("1w xqfb3,7krqfli.3bi14740370 ad2t.77xw,2xzqpww,l6w n,g w4k7n z,vqfet.wp4 7krrwtza ay,wqstf7mxw,2tlvjr3korx")

    assert_equal 210915, cracked.date
    assert_equal "1w xqfb3,7krqfli.3bi14740370 ad2t.77xw,2xzqpww,l6w n,g w4k7n z,vqfet.wp4 7krrwtza ay,wqstf7mxw,2tlvjr3korx", cracked.input
  end

  def test_that_the_character_map_initializes
    cracked = Cracked.new

    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
      "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6",
      "7", "8", "9", " ", ".", ","], cracked.character_map
    end

  def test_that_crack_key_rotation_can_output_the_correct_offset_numbers
    cracked = Cracked.new(",6 y338jx,ajr")

    assert_equal 19, cracked.crack_key_full_rotation(-4)
    assert_equal 25, cracked.crack_key_full_rotation(-3)
    assert_equal 36, cracked.crack_key_full_rotation(-2)
    assert_equal 11, cracked.crack_key_full_rotation(-1)
  end

  def test_that_crack_key_rotation_can_get_the_correct_offset_numbers_with_a_different_string_length
    cracked = Cracked.new("1w xqfb3,7krqfli.3bi14740370 ad2t.77xw,2xzqpww,l6w n,g w4k7n z,vqfet.wp4 7krrwtza ay,wqstf7mxw,2tlvjr3korx")

    assert_equal 19, cracked.crack_key_full_rotation(-4)
    assert_equal 25, cracked.crack_key_full_rotation(-3)
    assert_equal 36, cracked.crack_key_full_rotation(-2)
    assert_equal 11, cracked.crack_key_full_rotation(-1)
  end

  def test_that_crack_key_rotation_can_get_the_correct_offset_numbers_with_the_same_message_but_encrypted_with_a_different_key
    cracked = Cracked.new("9eo3y0s9hp1xy02oglso9ml 8ll6fvu81tla5eq85h7v4eqrbeoth1o2,5ltfhq1y0vzge6 fp1xze 5isr4he7y10ls5eq816,pzl1uzf")

    assert_equal 27, cracked.crack_key_full_rotation(-4)
    assert_equal 7, cracked.crack_key_full_rotation(-3)
    assert_equal 14, cracked.crack_key_full_rotation(-2)
    assert_equal 17, cracked.crack_key_full_rotation(-1)
  end

  def test_that_we_can_crack_a_short_encrypted_message
    cracked = Cracked.new(",6 y3e8jx,ajr")

    assert_equal "thanks..end..", cracked.join_chars_string
  end

  def test_that_we_can_crack_a_long_encrypted_message
    cracked = Cracked.new("1w xqfb3,7krqfli.3bi14740370 ad2t.77xw,2xzqpww,l6w n,g w4k7n z,vqfet.wp4 7krrwtza ay,wqstf7mxw,2tlvjr3korx")

    assert_equal "i am testing to see if the program we created can actually crack this string. wouldnt that be crazy..end..", cracked.join_chars_string
  end

  def test_that_we_can_crack_long_encrypted_message_but_with_a_different_key
    cracked = Cracked.new("9eo3y0s9hp1xy02oglso9ml 8ll6fvu81tla5eq85h7v4eqrbeoth1o2,5ltfhq1y0vzge6 fp1xze 5isr4he7y10ls5eq816,pzl1uzf")

    assert_equal "i am testing to see if the program we created can actually crack this string. wouldnt that be crazy..end..", cracked.join_chars_string
  end

end
