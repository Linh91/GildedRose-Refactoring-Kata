require './lib/gilded_rose'

describe BackstagePass do
  describe "Backstage passes to a TAFKAL80ETC concert" do
    it "will returns a string" do
      backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 21)]
      expect(backstage_pass[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 11, 21"
    end

    it "quality will increase by 3, when sell_in is 5 or less" do
      backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
      GildedRose.new(backstage_pass).update_quality()
      expect(backstage_pass[0].quality).to eq 13
    end

    it "when sell_in is 5 or less, quality will increase by 3" do
      backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 3, 15)]
      GildedRose.new(backstage_pass).update_quality()
      expect(backstage_pass[0].quality).to eq 18
    end

    it "when sell_in is 10 or less, quality will increase by 2" do
      backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 9)]
      GildedRose.new(backstage_pass).update_quality()
      expect(backstage_pass[0].quality).to eq 11
    end

    it "quality will increase by 2, when sell_in is 10 or less" do
      backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 8, 19)]
      GildedRose.new(backstage_pass).update_quality()
      expect(backstage_pass[0].quality).to eq 21
    end

    it "when sell_in is more than 10, quality will increase by 1" do
      backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 18, 19)]
      GildedRose.new(backstage_pass).update_quality()
      expect(backstage_pass[0].quality).to eq 20
      expect(backstage_pass[0].sell_in).to eq 17
    end

    it "when sell_in is 0, quality will become 0" do
      backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
      GildedRose.new(backstage_pass).update_quality()
      expect(backstage_pass[0].quality).to eq 0
      expect(backstage_pass[0].sell_in).to eq -1
    end

    it "quality is never negative" do
      backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 33)]
      GildedRose.new(backstage_pass).update_quality()
      expect(backstage_pass[0].quality).to eq 0
      expect(backstage_pass[0].sell_in).to eq -1
    end

    it "quality will not increase over 50" do
      backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 50)]
      GildedRose.new(backstage_pass).update_quality()
      expect(backstage_pass[0].quality).to eq 50
      expect(backstage_pass[0].sell_in).to eq 4
    end

    it "quality will limit at 50" do
      backstage_pass = [Item.new("Backstage passes to a TAFKAL80ETC concert", 22, 50)]
      GildedRose.new(backstage_pass).update_quality()
      expect(backstage_pass[0].quality).to eq 50
      expect(backstage_pass[0].sell_in).to eq 21
    end
  end
end
