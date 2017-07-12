class AgedBrie
  attr_reader :quality, :sell_in, :name

  def initialize(name, quality, sell_in)
    @name, @quality, @sell_in = name, quality, sell_in
  end

  def item_update
    @sell_in -= 1
    return if @quality == 50
    @quality += 1
    @quality += 1 if @sell_in <= 0
  end
end
