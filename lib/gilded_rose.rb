require './lib/normal'
require './lib/aged_brie'
require './lib/conjured'
require './lib/backstage_pass'
require './lib/Sulfuras'

class GildedRose

  PRODUCTS = {'Aged Brie' => AgedBrie,
              'Sulfuras, Hand of Ragnaros' => Sulfuras,
              'Backstage passes to a TAFKAL80ETC concert' => BackstagePass,
              'Conjured'=> Conjured}

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      updated_product = (PRODUCTS[item.name] || Normal).new
      # (item.name, item.quality, item.sell_in)
      updated_product.item_update(item)
      # p updated_product
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
