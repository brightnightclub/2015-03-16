class Clue

  def initialize attributes, &block
    @description = attributes[:description]
    @alias = attributes[:alias]
    @action = block
  end

end
