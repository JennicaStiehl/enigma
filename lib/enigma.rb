require './lib/cryptographer'

class Enigma < Cryptographer
  attr_reader   :shift

  def initialize
    super
  end

  def encrypt(message, keys = @key.get_keys, date = @offset.today)
    shifts = get_shifts(keys, date)
    message = get_encrypted_message(message, shifts)
    result = {}
    result[:encryption] = message
    result[:key] = @key.pad(5,keys.to_s)
    result[:date] = @key.pad(6,date.to_s)
    result
  end

  def decrypt(message, keys = @key.get_keys, date = @offset.today)
    shifts = get_shifts(keys, date)
    message = get_decrypted_message(message, shifts)
    result = {}
    result[:decryption] = message
    result[:key] = @key.pad(5,keys.to_s)
    result[:date] = @key.pad(6,date.to_s)
    result
  end

  def get_encrypted_message(message, shifts)
    new_message = []
    new_message = message.split(//).map.with_index do |letter, i|
      if @alphabet.include?(letter)
        num_to_rotate = @alphabet.index(letter) + shifts.first
        shifts.rotate!(1)
        @alphabet.rotate(num_to_rotate).first
      end
    end
    new_message.join
  end

  def get_decrypted_message(message, shifts)
    new_message = []
    new_message = message.split(//).map.with_index do |letter, i|
      if @alphabet.include?(letter)
        num_to_rotate = @alphabet.index(letter) - shifts.first
        shifts.rotate!(1)
        @alphabet.rotate(num_to_rotate).first
      end
    end
    new_message.join
  end
end
