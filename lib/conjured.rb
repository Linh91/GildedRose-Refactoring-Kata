class Conjured
  attr_reader :quality, :sell_in, :name

  def initialize(name, quality, sell_in)
    @name, @quality, @sell_in = name, quality, sell_in
  end

  def item_update
    @sell_in -= 2
    if @quality != 0
      @quality -= 2
      @quality -= 2 if @sell_in <= 0
    end
  end
end
