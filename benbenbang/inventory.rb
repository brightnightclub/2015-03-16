class Inventory
  @@items = []
  @@strength = 0
  
  def add item
    @@items.push(item)
    @@strength += item[:strength]
    "#{item} picked up!"
  end
  
  def drop item
    @@items.delete(item)
    @@strength -= item.strength
    "#{item} dropped!"
  end
end