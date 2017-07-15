class Normal
  # attr_reader :quality, :sell_in, :name
  #
  # def initialize(name, quality, sell_in)
  #   @name, @quality, @sell_in = name, quality, sell_in
  # end

  def item_update(item)
    item.sell_in -= 1
    if item.quality != 0
      item.quality -= 1
      item.quality -= 1 if item.sell_in <= 0
    end
  end
end
