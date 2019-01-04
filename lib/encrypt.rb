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

end
