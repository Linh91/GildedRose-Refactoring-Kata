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
        return backstage_update
      end
    #   if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
    #     if item.quality > 0
    #       if item.name != "Sulfuras, Hand of Ragnaros"
    #         item.quality = item.quality - 1
    #       end
    #     end
    #   else
    #     if item.quality < 50
    #       item.quality = item.quality + 1
    #       if item.name == "Backstage passes to a TAFKAL80ETC concert"
    #         if item.sell_in < 11
    #           if item.quality < 50
    #             item.quality = item.quality + 1
    #           end
    #         end
    #         if item.sell_in < 6
    #           if item.quality < 50
    #             item.quality = item.quality + 1
    #           end
    #         end
    #       end
    #     end
    #   end
    #   if item.name != "Sulfuras, Hand of Ragnaros"
    #     item.sell_in = item.sell_in - 1
    #   end
    #   if item.sell_in < 0
    #     if item.name != "Aged Brie"
    #       if item.name != "Backstage passes to a TAFKAL80ETC concert"
    #         if item.quality > 0
    #           if item.name != "Sulfuras, Hand of Ragnaros"
    #             item.quality = item.quality - 1
    #           end
    #         end
    #       else
    #         item.quality = item.quality - item.quality
    #       end
    #     else
    #       if item.quality < 50
    #         item.quality = item.quality + 1
    #       end
    #     end
    #   end
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

  def backstage_update
    if @items[0].sell_in <= 10 && @items[0].sell_in > 5
      @items[0].sell_in -= 1
      @items[0].quality += 2
    elsif @items[0].sell_in <= 5 && @items[0].sell_in > 0
      @items[0].sell_in -= 1
      @items[0].quality += 3
    else
      @items[0].sell_in -= 1
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
