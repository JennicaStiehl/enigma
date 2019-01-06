require './lib/decrypt'
require './lib/enigma'
require './lib/key'
require './lib/offset'
require 'pry'
# ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

enigma = Enigma.new

outgoing_text_1 = "Created #{ARGV[1]} with the key #{ARGV[2]} and date #{ARGV[3]}"
outgoing_text_3 = enigma.decrypt(incoming_text, key_1, date_1)

writer = File.open(ARGV[1], 'w')
writer.write("#{outgoing_text_1} #{outgoing_text_3}")
writer.close
