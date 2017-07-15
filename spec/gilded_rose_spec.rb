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

  describe "Aged Brie" do
    it "will decrease in sell_in but increase in quality" do
      items = [Item.new("Aged Brie", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 11
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

    it "quality will never increase above 50" do
      items = [Item.new("Aged Brie", 0, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
      expect(items[0].sell_in).to eq -1
    end

    it "quality will never increase above 50" do
      items = [Item.new("Aged Brie", 5, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
      expect(items[0].sell_in).to eq 4
    end
  end

  describe "Backstage passes to a TAFKAL80ETC concert" do
    it "when sell_in is 5 or less, quality will increase by 3" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 13
    end

    it "when sell_in is 5 or less, quality will increase by 3" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 15)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 18
    end

    it "when sell_in is 10 or less, quality will increase by 2" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 9)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 11
    end

    it "when sell_in is 10 or less, quality will increase by 2" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 19)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 21
    end

    it "when sell_in is more than 10, quality will increase by 1" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 18, 19)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 20
      expect(items[0].sell_in).to eq 17
    end

    it "when sell_in is 0, quality will become 0" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
      expect(items[0].sell_in).to eq -1
    end

    it "quality is never negative" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 33)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
      expect(items[0].sell_in).to eq -1
    end

    it "quality will not increase over 50" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
      expect(items[0].sell_in).to eq 4
    end

    it "quality will not increase above 50" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 22, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
      expect(items[0].sell_in).to eq 21
    end
  end

  describe "Sulfuras, Hand of Ragnaros" do
    it "it is a legacy item; quality and sell_in never changes" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 33)]
      GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 33
    end

    it "sell_in and quality will not change" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 21, 36)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 36
      expect(items[0].sell_in).to eq 21
    end
  end

  describe "Conjured items" do
    it "quality will degrade twice as fast than normal items" do
      items = [Item.new("Conjured", 21, 36)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 34
      expect(items[0].sell_in).to eq 19
    end

    it "sell_in will degrade twice as fast than normal items" do
      items = [Item.new("Conjured", 17, 8)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 6
      expect(items[0].sell_in).to eq 15
    end

    it "quality will degrades by 4 when sell_in is 0" do
      items = [Item.new("Conjured", 0, 8)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 4
      expect(items[0].sell_in).to eq -2
    end
  end
end
