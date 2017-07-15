require './lib/gilded_rose'
describe Normal do
  describe "Normal items" do
    it "returns a string" do
      other_items = [Item.new("Pies", 33, 16)]
      expect(other_items[0].to_s).to eq "Pies, 33, 16"
    end

    it "sell_in" do
      other_items = [Item.new("foo", 3, 4)]
      GildedRose.new(other_items).update_quality()
      expect(other_items[0].sell_in).to eq 2
      expect(other_items[0].quality).to eq 3
    end

    it "will decrease sell_in by 1" do
      other_items = [Item.new("foo", 0, 0)]
      GildedRose.new(other_items).update_quality()
      expect(other_items[0].sell_in).to eq -1
    end

    it "will decrease quality by 1" do
      other_items = [Item.new("Apple", 3, 2)]
      GildedRose.new(other_items).update_quality()
      expect(other_items[0].quality).to eq 1
    end

    it "when item sell_in date has passed, quality reduces twice as fast" do
      other_items = [Item.new("foo", 0, 10)]
      GildedRose.new(other_items).update_quality()
      expect(other_items[0].quality).to eq 8
      expect(other_items[0].sell_in).to eq -1
    end

    it "item quality is never negative" do
      other_items = [Item.new("foo", 2, 0)]
      GildedRose.new(other_items).update_quality()
      expect(other_items[0].quality).to eq 0
      expect(other_items[0].sell_in).to eq 1
    end
  end
end
