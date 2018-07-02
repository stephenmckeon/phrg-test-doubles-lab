class Leaf
  attr_reader :branch

  def initialize(branch)
    @branch = branch
  end

  def color
    "green"
  end
end
