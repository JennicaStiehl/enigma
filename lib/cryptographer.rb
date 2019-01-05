require './lib/key'

class Cryptographer
  attr_reader   :alphabet

  def initialize
    @alphabet = ('a'..'z').to_a << ' '
    @key = Key.new
    @offsets = []
    @shifts = []
  end

  def get_shifts(keys = @key.get_keys, date = today)
    offsets = get_offsets(date)
    pairs = @key.keys_main(keys)
    offsets.split(//).each.with_index do |offset, i|
        @shifts << offset.to_i + pairs[i]
    end
    @shifts
  end
end
