class Room

  attr_reader(:description, :doors)

  def initialize attributes
    @description = attributes[:description]
    @doors = {}
    @clues = []
  end

  def connect direction, room
    @doors[direction] = room
  end

  def add_clue clue
    @clues.push clue
  end

  def has_clue? clue_alias
    @clues.any?  do |clue|
      clue.known_as? clue_alias
    end
  end

  def take_clue clue_alias
    the_clue = @clues.select do |clue|
      clue.known_as? clue_alias
    end
    # @clues.delete the_clue
  end

  def has_door direction
    @doors.has_key?(direction)
  end
end
