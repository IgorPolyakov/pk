require 'socket'
require 'ffaker'

def caesar_cipher(string, shift = 1)
  alphabet   = Array('a'..'z')
  encrypter  = Hash[alphabet.zip(alphabet.rotate(shift))]
  string.chars.map { |c| encrypter.fetch(c, ' ') }
end

server = TCPServer.new 8888
loop do
  Thread.start(server.accept) do |client|
    phrase = FFaker::Lorem.phrase.downcase.chomp('.')
    start_time = Time.now
    client.puts caesar_cipher(phrase, rand(1..26)).join
    line = client.gets
    if (Time.now - start_time) > 1
      client.puts 'too slow'
    elsif phrase == line.chomp
      client.puts 'good job'
    else
      client.puts 'wrong'
    end
    client.close
  end
end
