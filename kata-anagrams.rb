require 'benchmark'
module Kata_anagrams

  def fileExists(file_name)

    if File.exist?(file_name) then
      file = File.new(file_name,'r')
      return true
    else
      return StandardError.new('file do not exist')
    end

  end
  
  def dataIsValid?(data)
    
    data.each do |word|

      if word.match(/[ !@#$%^&*(),.?":{}|<>0-9]/) then
        data.delete(word)
      end
      
    end

    return data

  end

  def findAnagrams(data)
    answer = []
    anagrams = {}

    File.readlines("file.txt").each_with_object(Hash.new []) do |word, hash|
        hash[word.chars.sort.join] += [word]
        anagrams = hash 
       
    end

    anagrams.each do |hashData|
      if hashData[1].length > 1 then
        answer.push(hashData[1].join(' '))
      end
    end

    return answer

  end

  def manualInputIsValid?(input)
    if input.match(/\[[a-z,A-Z]+\]/) then 
      return  input.scan(/\w+/)
    else
      return StandardError.new('invalid input')
    end

  end

  def main(choise)

    case choise
      when '1'
        fileLocation = 'file.txt'
        file = fileExists(fileLocation)
        data = dataIsValid?(file)
        return findAnagrams(data).length
      when '2'
        $stdout.puts "ingrese el arreglo"
        input = $stdin.gets.chomp
        data = manualInputIsValid?(input)
        return findAnagrams(data).length
    end

  end

end

include Kata_anagrams


$stdout.puts "seleccione si desa determinar el anagrama de un archivo o ingresar el arreglo de palabras"
$stdout.puts "1 - Usar un archivo"
$stdout.puts "2 - Ingresar arreglo de palabras"
choise = $stdin.gets.chomp
$stdout.puts ""

puts "El numero de anagramas encontrados es  #{Kata_anagrams.main(choise)}"
puts "El programa tardo #{Benchmark.measure { main(choise)*1_000_000_000 }}" 

choise = $stdin.gets.chomp


