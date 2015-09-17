gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/emoji'
require_relative 'crack'

class CrackedTest < Minitest::Test

  def test_it_can_get_the_correction_to_the_a_roation_of_the_last_seven_characters
    cracked = Cracked.new(",6 y338jx,ajr")
    assert_equal "x", cracked.crack_key
  end

  def test_it_can_get_the_correction_to_the_a_roation_of_the_last_seven_characters_in_a_different_string
    cracked = Cracked.new("this isthe last..end..")
    assert_equal ".", cracked.crack_key
  end

  def test_it_can_get_the_correction_to_the_a_roation_with_just_end
    cracked = Cracked.new("..end..")
    assert_equal ".", cracked.crack_key
  end

  def test_it_can_get_a_rotation_with_just_spaces_and_end
    cracked = Cracked.new("          ...end..")
    assert_equal ".", cracked.crack_key
    end

  def test_the_full_roation_withing_the_crack_method
    cracked = Cracked.new(",6 y338jx,ajr")
    assert_equal "e", cracked.crack_key
  end


end
