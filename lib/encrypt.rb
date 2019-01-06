require './lib/encrypt'
require './lib/enigma'
require './lib/key'
require './lib/offset'
require 'pry'
# ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818
handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

enigma = Enigma.new
# binding.pry
outgoing_text = enigma.encrypt(incoming_text, "02715", "040895")

writer = File.open(ARGV[1], 'w')
writer.write(outgoing_text)
writer.close
