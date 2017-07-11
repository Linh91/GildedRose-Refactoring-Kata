class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Aged Brie"
        return aged_brie_update
      elsif item.name == "Sulfuras, Hand of Ragnaros"
        return sulfuras_update
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        return backstage_pass_update
      elsif item.name == "Conjured"
        return conjured_item_update
      else
        return normal_item_update
      end
    end
  end

  def conjured_item_update
    @items[0].sell_in -= 2
    if @items[0].quality != 0
      @items[0].quality -= 2
      @items[0].quality -= 2 if @items[0].sell_in <= 0
    end
  end

  def normal_item_update
    @items[0].sell_in -= 1
    if @items[0].quality != 0
      @items[0].quality -= 1
      @items[0].quality -= 1 if @items[0].sell_in <= 0
    end
  end
  def aged_brie_update
    @items[0].sell_in -= 1
    return if @items[0].quality == 50
    @items[0].quality += 1
    @items[0].quality += 1 if @items[0].sell_in <= 0
  end

  def sulfuras_update
  end

  def backstage_pass_update
    @items[0].sell_in -= 1
    return if @items[0].quality == 50
    if @items[0].sell_in > 0
      @items[0].quality += 1
      @items[0].quality += 1 if @items[0].sell_in.between?(6, 10)
      @items[0].quality += 2 if @items[0].sell_in.between?(1, 5)
    else
      @items[0].quality = 0
    end
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
