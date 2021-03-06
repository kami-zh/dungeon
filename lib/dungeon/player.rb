class Player
  attr_accessor :x, :y

  def initialize(window)
    @window = window

    # TODO: Set depending on player level
    @x = 4
    @y = 4
  end

  def draw
    @window.map.tile(@x, @y, 2).draw
  end

  def button_down(id)
    case id
    when Gosu::KbUp    then @y -= 1 if @window.map.passable?(@x, @y - 1)
    when Gosu::KbDown  then @y += 1 if @window.map.passable?(@x, @y + 1)
    when Gosu::KbRight then @x += 1 if @window.map.passable?(@x + 1, @y)
    when Gosu::KbLeft  then @x -= 1 if @window.map.passable?(@x - 1, @y)
    end
  end
end
