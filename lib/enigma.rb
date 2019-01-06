require './lib/cryptographer'

class Enigma < Cryptographer
  attr_reader   :shift

  def initialize
    super
  end

  def encrypt(message, keys = @key.get_keys, date = @offset.today)
    check_shifts(keys, date)
    message = get_encrypted_message(message, @shifts)
    result = {}
    result[:encryption] = message
    result[:key] = @key.pad(5,keys.to_s)
    result[:date] = @key.pad(6,date.to_s)
    result
  end

  def decrypt(message, keys = @key.get_keys, date = @offset.today)
    check_shifts(keys, date)
    message = get_decrypted_message(message, shifts)
    result = {}
    result[:decryption] = message
    result[:key] = @key.pad(5,keys.to_s)
    result[:date] = @key.pad(6,date.to_s)
    result
  end

  def get_encrypted_message(message, shifts)
    new_message = message.downcase.split(//).map.with_index do |letter, i|
      rotate_for_encrypt(letter, i, shifts)
    end
    new_message.join
  end

  def get_decrypted_message(message, shifts)
    new_message = message.downcase.split(//).map.with_index do |letter, i|
      rotate_for_decrypt(letter, i, shifts)
    end
    new_message.join
  end

  def check_shifts(keys = @key.get_keys, date = @offset.today)
    if self.shifts.count == 4
      shifts = self.shifts
    else
      shifts = get_shifts(keys, date)
    end
    shifts
  end

  def check_alphabet(letter)
    @alphabet.include?(letter)
  end

  def check_special_characters(letter)
    @special_characters.include?(letter)
  end

  def rotate_for_encrypt(letter, i, shifts)
    if check_alphabet(letter)
      num_to_rotate = @alphabet.index(letter) + shifts.first
      shifts.rotate!(1)
      @alphabet.rotate(num_to_rotate).first
    elsif check_special_characters(letter) && i != 0
      shifts.rotate!(1)
      letter
    else
      letter
    end
  end

  def rotate_for_decrypt(letter, i, shifts)
    if check_alphabet(letter)
      num_to_rotate = @alphabet.index(letter) - shifts.first
      shifts.rotate!(1)
      @alphabet.rotate(num_to_rotate).first
    elsif check_special_characters(letter) && i != 0
      shifts.rotate!(1)
      letter
    else
      letter
    end
  end

end
