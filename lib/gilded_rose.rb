require './lib/normal'
require './lib/aged_brie'
require './lib/conjured'
require './lib/backstage_pass'
require './lib/Sulfuras'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Aged Brie"
        @items[0] = AgedBrie.new(@items[0].name, @items[0].quality, @items[0].sell_in)
        @items[0].item_update
      elsif item.name == "Sulfuras, Hand of Ragnaros"
        return sulfuras_update
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        return backstage_pass_update
      elsif item.name == "Conjured"
        @items[0] = Conjured.new(@items[0].name, @items[0].quality, @items[0].sell_in)
        @items[0].item_update
      else
        @items[0] = Normal.new(@items[0].name, @items[0].quality, @items[0].sell_in)
        @items[0].item_update
      end
    end
  end

  # def aged_brie_update
  #   @items[0] = AgedBrie.new(@items[0].name, @items[0].quality, @items[0].sell_in)
  #   @items[0].item_update
  # end

  def sulfuras_update
    @items[0] = Sulfuras.new(@items[0].name, @items[0].quality, @items[0].sell_in)
    @items[0].item_update
  end

  def backstage_pass_update
    @items[0] = BackstagePass.new(@items[0].name, @items[0].quality, @items[0].sell_in)
    @items[0].item_update
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
