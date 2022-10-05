require 'benchmark'
module Kata_anagrams

  def fileExists(file_name)

    if File.exist?(file_name) then
      return file_name
    elsif file_name.match(/\[[a-z,A-Z]+\]/) then 
      return  file_name.scan(/\w+/)
    else
      return StandardError.new('file do not exist')
    end

  end

  def dataIsValid?(data)
    if data.match(/[ !@#$%^&*(),.?":{}|<>0-9]/) then
      return 'invalid data'
    else
      return true
    end
  end

  def findAnagrams(file_name)
    answer = []
    anagrams = {}

    if file_name.is_a? String then

      File.readlines(file_name, chomp: true).each_with_object(Hash.new []) do |word, hash|
        if dataIsValid?(word) then
          hash[word.chars.sort.join] += [word]
          anagrams = hash
        end
      end
    else
      file_name.each_with_object(Hash.new []) do |word, hash|
        if dataIsValid?(word) then
          hash[word.chars.sort.join] += [word]
          anagrams = hash
        end
      end
    end

    anagrams.each do |hashData|
      if hashData[1].length > 1 then
        answer.push(hashData[1].join(' '))
      end
    end

    return answer

  end

  def main(choise)

    file = fileExists(choise)
    return findAnagrams(file).length

  end

end

include Kata_anagrams

$stdout.puts 'si desea ejecutar un archivo, ingrese el nombre del mismo, de lo contrario ingrese un arreglo'
choise = $stdin.gets.chomp
$stdout.puts""

$stdout.puts "El numero de anagramas encontrados es #{Kata_anagrams.main(choise)}"
$stdout.puts"El programa tardo #{Benchmark.measure {main(choise)*1_000_000_000}}"

