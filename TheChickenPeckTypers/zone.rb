class Zone
  attr_accessor(:base_description)

  def initialize()
    @base_description = base_description
    @extended = ""
  end

  def extended=(string)
    @extended = string
  end

  def extended
    @extended
  end

end
