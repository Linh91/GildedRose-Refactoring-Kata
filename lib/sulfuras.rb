class Sulfuras
  attr_reader :quality, :sell_in, :name

  def initialize(name, quality, sell_in)
    @name, @quality, @sell_in = name, quality, sell_in
  end

  def item_update
  end
end
