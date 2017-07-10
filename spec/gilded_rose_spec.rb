require './lib/gilded_rose'

describe GildedRose do
  describe "#update_quality" do
    it "does not change the item name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
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
  end

  describe "Aged Brie" do
    it "will decrease in sell_in" do
      items = [Item.new("Aged Brie", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "will increase in quality as sell_in decreases" do
      items = [Item.new("Aged Brie", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 11
      expect(items[0].sell_in).to eq 9
    end

    it "will increase in quality as sell_in decreases" do
      items = [Item.new("Aged Brie", 23, 13)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 14
      expect(items[0].sell_in).to eq 22
    end

    it "quality above 50 will not change but sell_in still decreases by 1" do
      items = [Item.new("Aged Brie", 10, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
      expect(items[0].sell_in).to eq 9
    end

    it "quality will increase by 2 when sell_in is 0" do
      items = [Item.new("Aged Brie", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 12
      expect(items[0].sell_in).to eq -1
    end

    it "sell_in is 0, quality will increase by 2" do
      items = [Item.new("Aged Brie", 0, 22)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 24
      expect(items[0].sell_in).to eq -1
    end
  end

  describe "Backstage passes to a TAFKAL80ETC concert" do
    it "when sell_in is 5 or less, quality will increase by 3" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 13
    end
  end

end
