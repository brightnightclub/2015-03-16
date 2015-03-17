class Room

  attr_reader(:description)

  def initialize attributes
    @description = attributes[:description]
    @doors = {}
    @clues = []
    @detectives = []
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
    @clues.delete the_clue
  end

  def add_detective detective
    @detectives.push detective
  end

  def remove_detective detective
    @detective.remove detective
  end

end
