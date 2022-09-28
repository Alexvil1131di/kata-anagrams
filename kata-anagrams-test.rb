require 'minitest/autorun'
require_relative 'kata-anagrams.rb'
include Kata_anagrams

class Test_anagrams < Minitest::Test

    def test_if_a_file_do_not_exist_throw_error
        assert_equal StandardError.new('file do not exist'), Kata_anagrams.fileExists('hola')
    end

    def test_file_data_should_be_on_an_array_if_file_exist
        assert_equal ["casa", "saca"], Kata_anagrams.fileExists('test.txt')
    end

    def test_words_should_not_contain_spaces
        assert_equal ['saca'], Kata_anagrams.dataIsValid?(['ca sa','saca'])
    end

    def test_words_should_not_contain_symbols
        assert_equal ['saca'], Kata_anagrams.dataIsValid?(['ca?sa','saca'])
    end

    def test_words_should_not_contain_numbers
        assert_equal ['saca'], Kata_anagrams.dataIsValid?(['ca9sa','saca'])
    end
    
    def test_if_an_agram_exist
        assert_equal ["casa saca scaa","oso soo oos"], Kata_anagrams.findAnagrams(['sdf','casa','saca','scaa', 'oso', 'soo', 'a','oos', 'df'])
    end

    def test_valid_entry_for_manual_input
        assert_equal ["casa","saca","soo","oso"], Kata_anagrams.manualInputIsValid?("[casa,saca,soo,oso]")
    end

    def test_whole_program
        assert_equal 20683, Kata_anagrams.main()
    end

end