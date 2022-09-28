require 'benchmark'
module Kata_anagrams

  def fileExists(file_name)

    if File.exist?(file_name) then
      file = File.new(file_name,'r')
      return file.readlines.map(&:chomp)
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

    data.each_with_object(Hash.new []) do |word, hash|
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

  def main()

    $stdout.puts "seleccione si desa determinar el anagrama de un archivo o ingresar el arreglo de palabras"
    $stdout.puts "1 - Ingresar la ubicacion del archivo"
    $stdout.puts "2 - Ingresar arreglo de palabras"
    choise = $stdin.gets.chomp
    $stdout.puts ""


    case choise
      when '1'
        $stdout.puts "ingrese el nombre del archivo"
        fileLocation = $stdin.gets.chomp
        file = fileExists(fileLocation)
        data = dataIsValid?(file)
        $stdout.puts findAnagrams(data)
        return findAnagrams(data).length
      when '2'
        $stdout.puts "ingrese el arreglo"
        input = $stdin.gets.chomp
        data = manualInputIsValid?(input)
        $stdout.puts findAnagrams(data)
        return findAnagrams(data).length
    end

  end

end

include Kata_anagrams

puts "El numero de anagramas encontrados es  #{Kata_anagrams.main()}"
puts "El programa tardo #{Benchmark.measure { "a"*1_000_000_000 }}" 

choise = $stdin.gets.chomp


