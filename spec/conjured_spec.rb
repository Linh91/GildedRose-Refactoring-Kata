require './lib/gilded_rose'

describe Conjured do
  describe "Conjured items" do
    it "will returns a string" do
      conjured_item = [Item.new("Conjured", 19, 11)]
      expect(conjured_item[0].to_s).to eq "Conjured, 19, 11"
    end

    it "quality will degrade twice as fast than normal items" do
      conjured_item = [Item.new("Conjured", 21, 36)]
      GildedRose.new(conjured_item).update_quality()
      expect(conjured_item[0].quality).to eq 34
      expect(conjured_item[0].sell_in).to eq 19
    end

    it "sell_in will degrade twice as fast than normal conjured_item" do
      conjured_item = [Item.new("Conjured", 17, 8)]
      GildedRose.new(conjured_item).update_quality()
      expect(conjured_item[0].quality).to eq 6
      expect(conjured_item[0].sell_in).to eq 15
    end

    it "quality will degrades by 4 when sell_in is 0" do
      conjured_item = [Item.new("Conjured", 0, 8)]
      GildedRose.new(conjured_item).update_quality()
      expect(conjured_item[0].quality).to eq 4
      expect(conjured_item[0].sell_in).to eq -2
    end
  end
end
