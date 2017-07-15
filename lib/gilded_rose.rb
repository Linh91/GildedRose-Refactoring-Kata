require './lib/normal'
require './lib/aged_brie'
require './lib/conjured'
require './lib/backstage_pass'
require './lib/Sulfuras'

class GildedRose

  PRODUCTS = {'Aged Brie' => AgedBrie,
              'Sulfuras, Hands of Ragnaros' => Sulfuras,
              'Backstage passes to a TAFKAL80ETC concert' => BackstagePass,
              'Conjured'=> Conjured}

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      updated_product = (PRODUCTS[item.name] || Normal).new(item.name, item.quality, item.sell_in)
      updated_product.item_update
      return updated_product
    #   if item.name == "Aged Brie"
    #     @items[0] = AgedBrie.new(@items[0].name, @items[0].quality, @items[0].sell_in)
    #     @items[0].item_update
    #   elsif item.name == "Sulfuras, Hand of Ragnaros"
    #     @items[0] = Sulfuras.new(@items[0].name, @items[0].quality, @items[0].sell_in)
    #     @items[0].item_update
    #   elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
    #     @items[0] = BackstagePass.new(@items[0].name, @items[0].quality, @items[0].sell_in)
    #     @items[0].item_update
    #   elsif item.name == "Conjured"
    #     @items[0] = Conjured.new(@items[0].name, @items[0].quality, @items[0].sell_in)
    #     @items[0].item_update
    #   else
    #     @items[0] = Normal.new(@items[0].name, @items[0].quality, @items[0].sell_in)
    #     @items[0].item_update
    #   end
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
