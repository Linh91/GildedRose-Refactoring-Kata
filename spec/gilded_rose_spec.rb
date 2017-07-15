require './lib/gilded_rose'

describe GildedRose do
  describe "#update_quality - normal items" do
    it "sell_in" do
      items = [Item.new("foo", 3, 4)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'foo'
    end

    it "sell_in" do
      items = [Item.new("foo", 3, 4)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 2
      expect(items[0].quality).to eq 3
    end

    it "will decrease sell_in by 1" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
    end

    it "will decrease quality by 1" do
      items = [Item.new("Apple", 3, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end

    it "when item sell_in date has passed, quality reduces twice as fast" do
      items = [Item.new("foo", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 8
      expect(items[0].sell_in).to eq -1
    end

    it "item quality is never negative" do
      items = [Item.new("foo", 2, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
      expect(items[0].sell_in).to eq 1
    end
  end


  # describe "Sulfuras, Hand of Ragnaros" do
  #   it "it is a legacy item; quality and sell_in never changes" do
  #     items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 33)]
  #     GildedRose.new(items).update_quality()
  #       expect(items[0].quality).to eq 33
  #   end
  #
  #   it "sell_in and quality will not change" do
  #     items = [Item.new("Sulfuras, Hand of Ragnaros", 21, 36)]
  #     GildedRose.new(items).update_quality()
  #     expect(items[0].quality).to eq 36
  #     expect(items[0].sell_in).to eq 21
  #   end
  # end
end
