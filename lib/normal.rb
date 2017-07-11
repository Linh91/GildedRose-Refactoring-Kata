class Normal
  attr_reader: quality, sell_in

  def initialize
    @quality, @sell_in = quality, sell_in
  end

  def item_update
    @items[0].sell_in -= 1
    if @items[0].quality != 0
      @items[0].quality -= 1
      @items[0].quality -= 1 if @items[0].sell_in <= 0
    end
  end
end
