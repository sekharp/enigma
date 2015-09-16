gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/encrypt.rb'

class EncryptTest < Minitest::Test

  def test_that_we_can_test_randomness
    size = 100.times.map { Encrypt.new(12345).key_generator }.uniq.size
    assert_operator 1, :<, size
  end

  def test_that_it_can_produce_a_date_integer_with_todays_date
    encrypt = Encrypt.new(12345)
    assert_equal 150915, encrypt.date
  end

  def test_key_rotations_are_created
    encrypt = Encrypt.new(12345)
    assert_equal 12, encrypt.key_a_rotation
    assert_equal 23, encrypt.key_b_rotation
    assert_equal 34, encrypt.key_c_rotation
    assert_equal 45, encrypt.key_d_rotation
  end

  def test_date_is_todays_date
    encrypt = Encrypt.new(12345)
    assert_equal 150915, encrypt.date
  end

  def test_that_square_the_date_method_works
    encrypt = Encrypt.new(12345)
    assert_equal 22775337225, encrypt.square_the_date
  end

  def test_offsets_are_created
    encrypt = Encrypt.new(12345)
    assert_equal 7, encrypt.a_offset
    assert_equal 2, encrypt.b_offset
    assert_equal 2, encrypt.c_offset
    assert_equal 5, encrypt.d_offset
  end

  def test_we_can_downcase_an_input_string
    encrypt = Encrypt.new(12345)
    assert_equal "thanks", encrypt.downcase_string
  end

  def test_we_can_chars_an_input_string
    encrypt = Encrypt.new(12345)
    assert_equal ["t", "h", "a", "n", "k", "s"], encrypt.chars_string
  end

  # pass in non defaults

  def test_we_can_iterate_over_a_elements
    encrypt = Encrypt.new(12345)
    assert_equal ",", encrypt.iteration[0]
    assert_equal "3", encrypt.iteration[4]
  end

  def test_we_can_iterate_over_b_elements
    encrypt = Encrypt.new(12345)
    assert_equal "6", encrypt.iteration[1]
    assert_equal "e", encrypt.iteration[5]
  end

  def test_we_can_iterate_over_c_elements
    encrypt = Encrypt.new(12345)
    assert_equal " ", encrypt.iteration[2]
  end

  def test_we_can_iterate_over_d_elements
    encrypt = Encrypt.new(12345)
    assert_equal "y", encrypt.iteration[3]
  end

  # def test_it_can_rotate_in_the_array
  #   skip
  #   encrypt = Encrypt.new(12345)
  #   encrypt.character_map.rotate(5)
  #   assert_equal "e", encrypt.character_map.rotate(5)
  # end

end
