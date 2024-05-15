class SlotMachine
  def initialize(reels)
    @reels = reels
  end

  VALUES = {
    'cherry' => 10,
    'seven' => 20,
    'bell' => 30,
    'star' => 40,
    'joker' => 50
  }

  def score
    if three_identical
      VALUES[@reels[0]]
    elsif two_and_at_least_a_joker
      VALUES[@reels.sort[1]] / 2
    else
      0
    end
  end

  private

  def three_identical
    @reels.uniq.count == 1
  end

  def two_and_at_least_a_joker
    @reels.uniq.count == 2 && @reels.include?('joker')
  end
end
