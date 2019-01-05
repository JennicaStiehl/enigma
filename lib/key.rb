class Key
attr_reader   :keys

  def initialize
    @keys = []
  end

  def keys_main(keys = get_keys)
    if keys.class == String
      key_array = get_key_array(keys)
      get_key_pairs(key_array)
    else
      get_keys
      padded_keys = pad(5, get_keys)
      key_array = get_key_array(padded_keys)
      @keys = get_key_pairs(key_array)
    end
  end

  def get_keys
    rand = rand(99999)
  end

  def pad(target_size, input)
    gap = target_size - input.to_s.length
    "0" * gap + "#{input}"
  end

  def get_key_array(keys)
    keys = keys.split(//)
    keys.map { |key| key.to_i }
  end

  def get_key_pairs(key_array)
    pairs = key_array.each_cons(2).to_a
    pairs = pairs.map { |pair| pair.join.to_i }
  end


end
