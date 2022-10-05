require 'minitest/autorun'
require_relative 'kata-anagrams.rb'
include Kata_anagrams

class Test_anagrams < Minitest::Test

    def test_if_a_file_do_not_exist_throw_an_error
        assert_equal StandardError.new('file do not exist'), Kata_anagrams.fileExists('hola')
    end

    def test_if_file_exist_return_filename
        assert_equal 'test.txt', Kata_anagrams.fileExists('test.txt')
    end

    def test_words_should_not_contain_spaces
        assert_equal 'invalid data', Kata_anagrams.dataIsValid?('ca sa')
    end

    def test_words_should_not_contain_symbols
        assert_equal 'invalid data', Kata_anagrams.dataIsValid?('ca?sa')
    end 

    def test_words_should_not_contain_numbers
        assert_equal 'invalid data', Kata_anagrams.dataIsValid?('ca09sa')
    end 

    def test_find_if_an_anagram_exist_between_a_group_of_words
        assert_equal ["casa saca","oso soo"], Kata_anagrams.findAnagrams(fileExists("test.txt"))
    end 

    def test_if_manual_input_is_valid
        assert_equal ["casa", "saca","oso", "soo"], Kata_anagrams.fileExists("[casa,saca,oso,soo]")
    end

    def test_whole_program
        assert_equal 20683, Kata_anagrams.main('file.txt')
    end

    
end