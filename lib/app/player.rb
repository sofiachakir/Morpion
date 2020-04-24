class Player
  attr_accessor :name, :turn, :score, :symbol

  def initialize(name)
    @name = name
    @turn = false
    @score = 0
    @symbol = 'X'.colorize(:blue)
  end
end
