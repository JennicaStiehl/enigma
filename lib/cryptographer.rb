require './lib/key'
require './lib/offset'

class Cryptographer
  attr_reader   :alphabet

  def initialize
    @alphabet = ('a'..'z').to_a << ' '
    @key = Key.new
    @offset = Offset.new
    @shifts = []
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
