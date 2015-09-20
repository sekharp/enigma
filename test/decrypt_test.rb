gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt.rb'

class DecryptTest < Minitest::Test

  def test_that_it_can_produce_a_date_integer_with_todays_date
    decrypt = Decrypt.new(12345, ",6 y3e")

    assert_equal 200915, decrypt.date
  end

  def test_that_class_initializes_with_input_key_and_encrypted_text
    decrypt = Decrypt.new(12345, ",6 y3e")

    assert_equal 12345, decrypt.key
    assert_equal ",6 y3e", decrypt.input
  end

  def test_that_class_initializes_with_different_input_key_and_encrypted_text
    decrypt = Decrypt.new(85249, "t3h6l3at")

    assert_equal 85249, decrypt.key
    assert_equal "t3h6l3at", decrypt.input
  end

  def test_that_chars_string_method_works
    decrypt = Decrypt.new(12345, ",6 y3e")

    assert_equal [",", "6", " ", "y", "3", "e"], decrypt.chars_string
  end

  def test_that_chars_string_method_works_for_another_key_and_input
    decrypt = Decrypt.new(85249, "t3h6l3at")

    assert_equal ["t", "3", "h", "6", "l", "3", "a", "t"], decrypt.chars_string
  end

  def test_key_rotations_are_created
    decrypt = Decrypt.new(12345, ",6 y3e")

    assert_equal 12, decrypt.key_rotation(1)
    assert_equal 23, decrypt.key_rotation(2)
    assert_equal 34, decrypt.key_rotation(3)
    assert_equal 45, decrypt.key_rotation(4)
  end

  def test_key_rotations_are_created_for_another_key_and_input
    decrypt = Decrypt.new(85249, "t3h6l3at")

    assert_equal 85, decrypt.key_rotation(1)
    assert_equal 52, decrypt.key_rotation(2)
    assert_equal 24, decrypt.key_rotation(3)
    assert_equal 49, decrypt.key_rotation(4)
  end


  def test_offsets_are_created
    decrypt = Decrypt.new(12345, ",6 y3e")

    assert_equal 7, decrypt.offset(1)
    assert_equal 2, decrypt.offset(2)
    assert_equal 2, decrypt.offset(3)
    assert_equal 5, decrypt.offset(4)
  end

  def test_offsets_are_created_for_another_key_and_input
    decrypt = Decrypt.new(85249, "t3h6l3at")

    assert_equal 7, decrypt.offset(1)
    assert_equal 2, decrypt.offset(2)
    assert_equal 2, decrypt.offset(3)
    assert_equal 5, decrypt.offset(4)
  end

  def test_full_rotation_created
    decrypt = Decrypt.new(12345, ",6 y3e")

    assert_equal 19, decrypt.full_rotation(1)
    assert_equal 25, decrypt.full_rotation(2)
    assert_equal 36, decrypt.full_rotation(3)
    assert_equal 50, decrypt.full_rotation(4)
  end

  def test_full_rotation_created_for_another_key_and_input
    decrypt = Decrypt.new(85249, "t3h6l3at")

    assert_equal 92, decrypt.full_rotation(1)
    assert_equal 54, decrypt.full_rotation(2)
    assert_equal 26, decrypt.full_rotation(3)
    assert_equal 54, decrypt.full_rotation(4)
  end

  def test_character_map_exists
    decrypt = Decrypt.new(12345, ",6 y3e")

    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
      "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6",
      "7", "8", "9", " ", ".", ","], decrypt.character_map
  end

  def test_character_map_exists_for_another_key_and_input
    decrypt = Decrypt.new(85249, "t3h6l3at")

    assert_equal ["a", "b", "c", "d", "e", "f", "g", "h", "i",
      "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
      "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6",
      "7", "8", "9", " ", ".", ","], decrypt.character_map
  end

  def test_we_can_decrypt_over_a_b_c_d_elements
    decrypt = Decrypt.new(12345, ",6 y3e")

    assert_equal "t", decrypt.decryption[0]
    assert_equal "k", decrypt.decryption[4]

    assert_equal "h", decrypt.decryption[1]
    assert_equal "s", decrypt.decryption[5]

    assert_equal "a", decrypt.decryption[2]

    assert_equal "n", decrypt.decryption[3]
  end

  def test_we_can_decrypt_over_a_b_c_d_elements_for_another_key_and_input
    decrypt = Decrypt.new(85249, "t3h6l3at")

    assert_equal "f", decrypt.decryption[0]
    assert_equal " ", decrypt.decryption[4]

    assert_equal "o", decrypt.decryption[1]
    assert_equal "o", decrypt.decryption[5]

    assert_equal "u", decrypt.decryption[2]
    assert_equal "n", decrypt.decryption[6]

    assert_equal "r", decrypt.decryption[3]
    assert_equal "e", decrypt.decryption[7]
  end

  def test_we_can_join_decrypted_array_into_a_string
    decrypt = Decrypt.new(12345, ",6 y3e")
    assert_equal "thanks", decrypt.join_chars_string
  end

  def test_we_can_join_decrypted_array_into_a_string_for_another_key_and_input
    decrypt = Decrypt.new(85249, "t3h6l3at")

    assert_equal "four one", decrypt.join_chars_string
  end

  def test_we_can_decrypt_another_input_string_with_twenty_characters
    decrypt = Decrypt.new(12345, ",6f3q7pi,iby,k7n0zo3")
    assert_equal "this is twenty chars", decrypt.join_chars_string
  end

end
