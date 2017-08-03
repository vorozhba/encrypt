if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require "digest"

puts "Введите слово или фразу для шифрования:"
phrase = STDIN.gets.chomp

puts "Каким способом зашифровать:"
puts "1. MD5"
puts "2. SHA1"
encr_mechanism = STDIN.gets.to_i

until encr_mechanism.between?(1, 2)
  puts "Выберите 1 или 2"
  encr_mechanism = STDIN.gets.to_i
end

puts "Вот что получилось:"

case encr_mechanism
when 1 then puts Digest::MD5.hexdigest(phrase)
when 2 then puts Digest::SHA1.hexdigest(phrase)
end
