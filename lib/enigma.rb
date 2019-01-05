require './lib/cryptographer'

class Enigma < Cryptographer
  attr_reader   :shift

  def initialize
    super
  end

  def encrypt(message, keys = get_keys, date = today)
    shifts = get_shifts(keys, date)
    message = get_encrypted_message(message, shifts)
    result = {}
    result[:encryption] = message
    result[:key] = keys
    result[:date] = date
    result
  end

  def decrypt(message, keys = get_keys, date = today)
    shifts = get_shifts(keys, date)
    message = get_decrypted_message(message, shifts)
    result = {}
    result[:decryption] = message
    result[:key] = keys
    result[:date] = date
    result
  end

  def get_encrypted_message(message, shifts)
    new_message = []
      new_message = message.split(//).map.with_index do |letter, i|
        num_to_rotate = @alphabet.index(letter) + shifts.first
        shifts.rotate!(1)
        @alphabet.rotate(num_to_rotate).first
    end
    new_message.join
  end

  def get_decrypted_message(message, shifts)
    new_message = []
      new_message = message.split(//).map.with_index do |letter, i|
        num_to_rotate = @alphabet.index(letter) - shifts.first
        shifts.rotate!(1)
        @alphabet.rotate(num_to_rotate).first
    end
    new_message.join
  end
end
