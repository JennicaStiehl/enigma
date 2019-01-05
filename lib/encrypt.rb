require './lib/cryptographer'

class Encrypt < Cryptographer
  attr_reader   :shift

  def initialize
    super
  end

  def encrypt(message, keys = get_keys, date = today)
    shifts = get_shifts(keys, date)
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


end
