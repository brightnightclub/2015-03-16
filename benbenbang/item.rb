class Item
  attr_accessor :strength, :name
  
  ITEMS = [
    { :name => "bazooka", :strength => 5 },
    { :name => "sword", :strength => 3 },
    { :name => "stick", :strength => 1 },
    { :name => "turd", :strength => -1 },
    { :name => "shuriken", :strength => 2 },
    { :name => "katana", :strength => 6 },
    { :name => "herring", :strength => 10 },
    { :name => "true love", :strength => 0 }
   ]
  
  def self.random
    item = ITEMS.sample
    new(item)
  end
  
  def initialize(attributes)
    @name = attributes[:name]
    @strength = attributes[:strength]
  end
end