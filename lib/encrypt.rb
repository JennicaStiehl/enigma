class Encrypt
  attr_reader   :alphabet,
                :keys

  def initialize
    @alphabet = ('a'..'z').to_a << ' '
    @keys = get_keys
  end

  def get_keys
    rand = rand(99999)
    @keys = pad(5, rand)
  end

  def pad(target_size, input)
    gap = target_size - input.to_s.length
    "0" * gap + "#{input}"
  end

  def key_array
    keys = @keys.split(//)
    integer_keys = keys.map { |key| key.to_i }
  end

  def get_key_pairs
    pairs = key_array.each_cons(2).to_a
    pairs.each { |pair| pair.join.to_i }
  end

  def today
      t= Date.today
      today = t.strftime("%m%d%y").to_i
  end

  def shifts
    shifts = (today * today).to_s.slice(-4,4).to_i
  end

end
