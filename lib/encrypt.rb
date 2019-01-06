require './lib/encrypt'
require './lib/enigma'
require './lib/key'
require './lib/offset'
require 'pry'
# ruby ./lib/encrypt.rb message.txt encrypted.txt
handle = File.open(ARGV[0], "r")
incoming_text = handle.read
handle.close

enigma = Enigma.new
key_1 = "82648"
date_1 = "240818"

outgoing_text_1 = "Created #{ARGV[1]} with the key #{key_1} and date #{date_1}"
outgoing_text_3 = enigma.encrypt(incoming_text, key_1, date_1)
# outgoing_text_2 = "<br>"

writer = File.open(ARGV[1], 'w')
writer.write("#{outgoing_text_1} #{outgoing_text_3}")
writer.close
