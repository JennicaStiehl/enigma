class Encrypt
  attr_reader   :alphabet,
                :keys

  def initialize
    @alphabet = ('a'..'z').to_a << ' '
  end

  def get_keys
    rand = rand(99999)
    keys = pad(5, rand)
  end

  def pad(target_size, input)
    gap = target_size - input.to_s.length
    "0" * gap + "#{input}"
  end

  def key_array
    keys = get_keys.split(//)
    integer_keys = keys.map { |key| key.to_i }
  end

  def get_key_pairs
    pairs = key_array.each_cons(2).to_a
    pairs = pairs.map { |pair| pair.join.to_i }
  end

  def today
      t= Date.today
      today = t.strftime("%m%d%y").to_i
  end

  def offsets
    offsets = (today * today).to_s.slice(-4,4)
  end

  def shifts
    shifts = []
    pairs = get_key_pairs
    offsets.split(//).each.with_index do |offset, i|
        shifts << offset.to_i + pairs[i]
    end
    shifts
  end

end
