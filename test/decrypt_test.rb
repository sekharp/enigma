gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt.rb'

class DecryptTest < Minitest::Test

  def test_key_rotations_are_created
    decrypt = Decrypt.new(12345)
    assert_equal 12, decrypt.key_rotation(1)
    assert_equal 23, decrypt.key_rotation(2)
    assert_equal 34, decrypt.key_rotation(3)
    assert_equal 45, decrypt.key_rotation(4)
  end

  def test_date_is_todays_date
    decrypt = Decrypt.new(12345)
    assert_equal 170915, decrypt.date
  end

  def test_that_square_the_date_method_works
    decrypt = Decrypt.new(12345)
    assert_equal 29211937225, decrypt.square_the_date
  end

  def test_offsets_are_created
    decrypt = Decrypt.new(12345)
    assert_equal 7, decrypt.offset(1)
    assert_equal 2, decrypt.offset(2)
    assert_equal 2, decrypt.offset(3)
    assert_equal 5, decrypt.offset(4)
  end

  def test_full_rotation_created
    decrypt = Decrypt.new(12345)
    assert_equal 19, decrypt.full_rotation(1)
    assert_equal 25, decrypt.full_rotation(2)
    assert_equal 36, decrypt.full_rotation(3)
    assert_equal 50, decrypt.full_rotation(4)
  end

  def test_we_can_chars_an_input_encrypted_string
    decrypt = Decrypt.new(12345)
    assert_equal [",", "6", " ", "y", "3", "e"], decrypt.chars_string
  end

  def test_we_can_decrypt_over_a_elements
    decrypt = Decrypt.new(12345)
    assert_equal "t", decrypt.decryption[0]
    assert_equal "k", decrypt.decryption[4]
  end

  def test_we_can_encrypt_over_b_elements
    decrypt = Decrypt.new(12345)
    assert_equal "h", decrypt.decryption[1]
    assert_equal "s", decrypt.decryption[5]
  end

  def test_we_can_encrypt_over_c_elements
    decrypt = Decrypt.new(12345)
    assert_equal "a", decrypt.decryption[2]
  end

  def test_we_can_encrypt_over_d_elements
    decrypt = Decrypt.new(12345)
    assert_equal "n", decrypt.decryption[3]
  end

  def test_we_can_join_the_encrypted_array_into_a_string
    decrypt = Decrypt.new(12345)
    assert_equal "thanks", decrypt.join_chars_string
  end

  def test_we_can_encrypt_another_input_string_with_eight_characters
    decrypt = Decrypt.new(12345, "yar2qakp")
    assert_equal "four one", decrypt.join_chars_string
  end

  def test_we_can_encrypt_same_input_string_with_eight_characters_with_another_key
    decrypt = Decrypt.new(85249, "t3h6l3at")
    assert_equal "four one", decrypt.join_chars_string
  end

  def test_we_can_encrypt_another_input_string_with_twenty_characters
    decrypt = Decrypt.new(12345, ",6f3q7pi,iby,k7n0zo3")
    assert_equal "this is twenty chars", decrypt.join_chars_string
  end

end
