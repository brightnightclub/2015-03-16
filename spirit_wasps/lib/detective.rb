class Detective

  attr_reader()

  def initialize attributes
      @name
      @room
  end

  def move(direction)
    if @room.has_door(direction)
      @room = @room.doors[direction]
    else
      puts "There isn't a door there."
    end
  end
  
end
