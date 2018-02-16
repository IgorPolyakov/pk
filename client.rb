require 'socket'
require 'ffaker'

def decrypt(string, shift = 25)
  alphabet   = Array('a'..'z')
  encrypter  = Hash[alphabet.zip(alphabet.rotate(shift))]
  string.chars.map { |c| encrypter.fetch(c, ' ') }
end

def check_contain(str)
  get_intersection(str).any?
end

def get_intersection(str)
  str.downcase.chomp.split(' ') & FFaker::Lorem.paragraphs.join.downcase.chomp.split(' ')
end

t = TCPSocket.new('185.111.219.128', 8888)
a_string = t.gets.chomp
p a_string
for i in 1..26 do
  p i
  str = decrypt(a_string, i).join
  if check_contain(str)
    t.puts(str)
    break
  end
end
t.puts(decrypt(a_string).join)
t.each_line do |line|
  puts line
end
t.close
