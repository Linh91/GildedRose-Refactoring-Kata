class BackstagePass
  def item_update(item)
    item.sell_in -= 1
    return if item.quality == 50
    if item.sell_in > 0
      item.quality += 1
      item.quality += 1 if item.sell_in.between?(6, 10)
      item.quality += 2 if item.sell_in.between?(1, 5)
    else
      item.quality = 0
    end
  end
end
