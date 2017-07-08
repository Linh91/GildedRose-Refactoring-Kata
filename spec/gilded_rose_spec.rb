require './lib/gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the item name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "changes the sell_in number" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq -1
    end

    it "quantity is the same" do
      items = [Item.new("Apple", 3, 2)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end
  end

end
