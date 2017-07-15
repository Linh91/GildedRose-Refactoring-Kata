require './lib/gilded_rose'

describe AgedBrie do
  describe "Aged Brie" do
    it "will return a string" do
      aged_brie = [Item.new("Aged Brie", 10, 10)]
      expect(aged_brie[0].to_s).to eq "Aged Brie, 10, 10"
    end

    it "sell_in will decrease" do
      aged_brie = [Item.new("Aged Brie", 23, 13)]
      GildedRose.new(aged_brie).update_quality()
      expect(aged_brie[0].quality).to eq 14
      expect(aged_brie[0].sell_in).to eq 22
    end
    
    it "will decrease in sell_in but increase in quality" do
      aged_brie = [Item.new("Aged Brie", 10, 10)]
      GildedRose.new(aged_brie).update_quality()
      expect(aged_brie[0].quality).to eq 11
      expect(aged_brie[0].sell_in).to eq 9
    end

    it "will increase in quality as sell_in decreases" do
      aged_brie = [Item.new("Aged Brie", 10, 10)]
      GildedRose.new(aged_brie).update_quality()
      expect(aged_brie[0].quality).to eq 11
      expect(aged_brie[0].sell_in).to eq 9
    end


    it "quality above 50 will not change but sell_in still decreases by 1" do
      aged_brie = [Item.new("Aged Brie", 10, 50)]
      GildedRose.new(aged_brie).update_quality()
      expect(aged_brie[0].quality).to eq 50
      expect(aged_brie[0].sell_in).to eq 9
    end

    it "quality will increase by 2 when sell_in is 0" do
      aged_brie = [Item.new("Aged Brie", 0, 10)]
      GildedRose.new(aged_brie).update_quality()
      expect(aged_brie[0].quality).to eq 12
      expect(aged_brie[0].sell_in).to eq -1
    end

    it "sell_in is 0, quality will increase by 2" do
      aged_brie = [Item.new("Aged Brie", 0, 22)]
      GildedRose.new(aged_brie).update_quality()
      expect(aged_brie[0].quality).to eq 24
      expect(aged_brie[0].sell_in).to eq -1
    end

    it "quality will never increase above 50" do
      aged_brie = [Item.new("Aged Brie", 0, 50)]
      GildedRose.new(aged_brie).update_quality()
      expect(aged_brie[0].quality).to eq 50
      expect(aged_brie[0].sell_in).to eq -1
    end

    it "quality will be a limit of 50" do
      aged_brie = [Item.new("Aged Brie", 5, 50)]
      GildedRose.new(aged_brie).update_quality()
      expect(aged_brie[0].quality).to eq 50
      expect(aged_brie[0].sell_in).to eq 4
    end
  end
end
