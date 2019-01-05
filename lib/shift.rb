require './lib/cryptographer'

class Shift < Cryptographer
  attr_reader   :offsets
  
  def initialize
    super
    @offsets = ""
  end

  def today
      t= Date.today
      today = t.strftime("%m%d%y").to_i
  end

  def offsets(date = today)
    @offsets = (date.to_i * date.to_i).to_s.slice(-4,4)
  end
end
