class Clue
  attr_reader :description

  def initialize attributes, &block
    @description = attributes[:description]
    @aliases = attributes[:aliases]
    @action = block
  end

  def known_as? the_alias
    @aliases.include? the_alias
  end

  def use
    @action.call
  end
end
