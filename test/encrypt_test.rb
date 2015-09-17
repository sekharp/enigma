gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt.rb'

class EncryptTest < Minitest::Test

  def test_that_we_can_test_randomness
    size = 100.times.map { Encrypt.new(12345).key_generator }.uniq.size
    assert_operator 1, :<, size
  end

  def test_that_it_can_produce_a_date_integer_with_todays_date
    encrypt = Encrypt.new(12345)
    assert_equal 170915, encrypt.date
  end

  def test_key_rotations_are_created
    encrypt = Encrypt.new(12345)
    assert_equal 12, encrypt.key_rotation(1)
    assert_equal 23, encrypt.key_rotation(2)
    assert_equal 34, encrypt.key_rotation(3)
    assert_equal 45, encrypt.key_rotation(4)
  end

  def test_key_rotations_are_created_for_another_key
    skip
  end

  def test_date_is_todays_date
    encrypt = Encrypt.new(12345)
    assert_equal 170915, encrypt.date
  end

  def test_that_square_the_date_method_works
    encrypt = Encrypt.new(12345)
    assert_equal 29211937225, encrypt.square_the_date
  end

  def test_offsets_are_created
    encrypt = Encrypt.new(12345)
    assert_equal 7, encrypt.offset(1)
    assert_equal 2, encrypt.offset(2)
    assert_equal 2, encrypt.offset(3)
    assert_equal 5, encrypt.offset(4)
  end

  def test_full_rotation_created
    encrypt = Encrypt.new(12345)
    assert_equal 19, encrypt.full_rotation(1)
    assert_equal 25, encrypt.full_rotation(2)
    assert_equal 36, encrypt.full_rotation(3)
    assert_equal 50, encrypt.full_rotation(4)
  end

  def test_full_rotation_created_for_another_key
    skip
  end

  # test for multiple dates and other keys for everything that uses them

  def test_we_can_downcase_an_input_string
    encrypt = Encrypt.new(12345)
    assert_equal "thanks", encrypt.downcase_string
  end

  def test_we_can_chars_an_input_string
    encrypt = Encrypt.new(12345)
    assert_equal ["t", "h", "a", "n", "k", "s"], encrypt.chars_string
  end

  def test_we_can_encrypt_over_a_elements
    encrypt = Encrypt.new(12345)
    assert_equal ",", encrypt.encryption[0]
    assert_equal "3", encrypt.encryption[4]
  end

  def test_we_can_encrypt_over_b_elements
    encrypt = Encrypt.new(12345)
    assert_equal "6", encrypt.encryption[1]
    assert_equal "e", encrypt.encryption[5]
  end

  def test_we_can_encrypt_over_c_elements
    encrypt = Encrypt.new(12345)
    assert_equal " ", encrypt.encryption[2]
  end

  def test_we_can_encrypt_over_d_elements
    encrypt = Encrypt.new(12345)
    assert_equal "y", encrypt.encryption[3]
  end

  def test_we_can_join_the_encrypted_array_into_a_string
    encrypt = Encrypt.new(12345)
    assert_equal ",6 y3e", encrypt.join_chars_string
  end

  def test_we_can_encrypt_another_input_string_with_eight_characters
    encrypt = Encrypt.new(12345, "Four One")
    assert_equal "yar2qakp", encrypt.join_chars_string
  end

  def test_we_can_encrypt_same_input_string_with_eight_characters_with_another_key
    encrypt = Encrypt.new(85249, "Four One")
    assert_equal "t3h6l3at", encrypt.join_chars_string
  end

  def test_we_can_encrypt_another_input_string_with_twenty_characters
    encrypt = Encrypt.new(12345, "This is twenty chars")
    assert_equal ",6f3q7pi,iby,k7n0zo3", encrypt.join_chars_string
  end

  def test_it_can_rotate_in_the_array
    skip
    # encrypt = Encrypt.new(12345)
    # encrypt.character_map.rotate(5)
    # assert_equal "e", encrypt.character_map.rotate(5)
  end

end
