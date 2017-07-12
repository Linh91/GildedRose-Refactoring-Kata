class BackstagePass
  attr_reader :quality, :sell_in, :name

  def initialize(name, quality, sell_in)
    @name, @quality, @sell_in = name, quality, sell_in
  end

  def item_update
    @sell_in -= 1
    return if @quality == 50
    if @sell_in > 0
      @quality += 1
      @quality += 1 if @sell_in.between?(6, 10)
      @quality += 2 if @sell_in.between?(1, 5)
    else
      @quality = 0
    end
  end
end
