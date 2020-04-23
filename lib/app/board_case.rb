class BoardCase
  attr_accessor :value

  def initialize
    @value = ' '
  end

  def cross
  	@value ='X'.colorize(:blue)
  end

  def ring
  	@value = 'O'.colorize(:red)
  end
end
