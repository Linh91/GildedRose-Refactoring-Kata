require './lib/gilded_rose'

describe Sulfuras do
  describe "Sulfuras, Hand of Ragnaros" do
    it "returns a string" do
      sulfuras = [Item.new("Sulfuras, Hand of Ragnaros", 30, 25)]
      expect(sulfuras[0].to_s).to eq "Sulfuras, Hand of Ragnaros, 30, 25"
    end

    it "it is a legacy item; quality and sell_in never changes" do
      sulfuras = [Item.new("Sulfuras, Hand of Ragnaros", 10, 33)]
      GildedRose.new(sulfuras).update_quality()
        expect(sulfuras[0].quality).to eq 33
    end

    it "sell_in and quality will not change" do
      sulfuras = [Item.new("Sulfuras, Hand of Ragnaros", 21, 36)]
      GildedRose.new(sulfuras).update_quality()
      expect(sulfuras[0].quality).to eq 36
      expect(sulfuras[0].sell_in).to eq 21
    end
  end
end
