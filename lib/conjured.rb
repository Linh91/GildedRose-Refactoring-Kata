class Conjured
  def item_update(item)
    item.sell_in -= 2
    if item.quality != 0
      item.quality -= 2
      item.quality -= 2 if item.sell_in <= 0
    end
  end
end
