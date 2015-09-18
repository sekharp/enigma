gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/emoji'
require_relative 'crack'

class CrackedTest < Minitest::Test

  # def test_it_can_get_the_correct_a_rotation_of_the_last_seven_characters
  #   cracked = Cracked.new(",6 y338jx,ajr")
  #   assert_equal "x", cracked.crack_key_a_full_rotation
  # end
  #
  # def test_it_can_get_the_correct_a_rotation_of_the_last_seven_characters_in_a_different_string
  #   cracked = Cracked.new("this isthe last..end..")
  #   assert_equal ".", cracked.crack_key_a_full_rotation
  # end
  #
  # def test_it_can_get_the_correct_a_rotation_with_just_end
  #   cracked = Cracked.new("..end..")
  #   assert_equal ".", cracked.crack_key_a_full_rotation
  # end
  #
  # def test_it_can_get_a_rotation_with_just_spaces_and_end
  #   cracked = Cracked.new("          ...end..")
  #   assert_equal ".", cracked.crack_key_a_full_rotation
  # end

  def test_that_crack_key_a_rotation_can_output_the_correct_offset_number
    cracked = Cracked.new(",6 y338jx,ajr")
    assert_equal 19, cracked.key_rotation_a
  end

  def test_that_crack_key_b_rotation_can_output_the_correct_offset_number
    cracked = Cracked.new(",6 y338jx,ajr")
    assert_equal 25, cracked.key_rotation_b
  end

  def test_that_crack_key_c_rotation_can_output_the_correct_offset_number
    cracked = Cracked.new(",6 y338jx,ajr")
    assert_equal 36, cracked.key_rotation_c
  end

  def test_that_crack_key_d_rotation_can_output_the_correct_offset_number
    cracked = Cracked.new(",6 y338jx,ajr")
    assert_equal 6, cracked.key_rotation_d
  end


end
