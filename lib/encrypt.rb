class Encrypt
  attr_reader   :alphabet,
                :keys

  def initialize
    @alphabet = ('a'..'z').to_a << ' '
  end

  def encrypt(message, keys = get_keys, date = today)
    shifts = shifts(keys, date)
    get_message(message, shifts)
  end

  def get_message(message, shifts)
    new_message = []
      new_message = message.split(//).map.with_index do |letter, i|
        num_to_rotate = @alphabet.index(letter) + shifts.first
        shifts.rotate!(1)
        @alphabet.rotate(num_to_rotate).first
    end
    new_message.join
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
    integer_keys = keys.map { |key| key.to_i }
  end

  def get_key_pairs(key_array)
    pairs = key_array.each_cons(2).to_a
    pairs = pairs.map { |pair| pair.join.to_i }
  end

  def today
      t= Date.today
      today = t.strftime("%m%d%y").to_i
  end

  def offsets(date = today)
    offsets = (date.to_i * date.to_i).to_s.slice(-4,4)
  end

  def keys_main(keys = get_keys)
    if keys.class == String
      key_array = get_key_array(keys)
      get_key_pairs(key_array)
    else#if keys.class == Integer
      get_keys
      padded_keys = pad(5, get_keys)
      key_array = get_key_array(padded_keys)
      get_key_pairs(key_array)
    end
  end

  def shifts(keys = get_keys, date = today)
    shifts = []
    offsets = offsets(date)
    pairs = keys_main(keys)
    offsets.split(//).each.with_index do |offset, i|
        shifts << offset.to_i + pairs[i]
    end
    shifts
  end


end
