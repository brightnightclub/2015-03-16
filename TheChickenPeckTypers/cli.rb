class Cli
  attr_accessor :input, :output

  def initialize
    @input = $stdin
    @output = $stdout
  end
end
