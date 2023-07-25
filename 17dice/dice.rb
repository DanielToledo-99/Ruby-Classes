class Dice
  def initialize
    @rolls = 0
  end

  def roll
    @rolls += 1
    puts rand(1..6)
  end

  def num_rolls
    puts @rolls
  end

  def reset
    @rolls = 0
  end
end