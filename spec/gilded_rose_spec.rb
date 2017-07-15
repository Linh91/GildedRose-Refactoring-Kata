require './lib/gilded_rose'

describe GildedRose do
  describe "#update_quality - normal items" do
    it "sell_in" do
      items = [Item.new("foo", 3, 4)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq 'foo'
    end
  end
end
