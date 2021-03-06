require './lib/key'
require './lib/offset'

class Cryptographer
  attr_reader   :alphabet,
                :special_characters,
                :key,
                :offset,
                :shifts,
                :encrypt,
                :decrypt

  def initialize
    @alphabet = ('a'..'z').to_a << ' '
    @special_characters = (33.chr..65.chr).to_a << (91.chr..96.chr)
    @key = Key.new
    @offset = Offset.new
    @shifts = []
    @encrypt = {}
    @decrypt = {}
  end

  def get_shifts(keys = @key.get_keys, date = @offset.today)
    offsets = @offset.get_offsets(date)
    pairs = @key.keys_main(keys)
    offsets.split(//).each.with_index do |offset, i|
        @shifts << offset.to_i + pairs[i]
    end
    @shifts
  end
end
