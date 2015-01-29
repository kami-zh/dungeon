class Tile
  SIZE = 20

  COLOR = {
    0 => 0xff000000,
    1 => 0xffffffff,
    2 => 0xff3399cc
  }

  def initialize(window, x, y, value)
    @window = window
    @x = x
    @y = y
    @value = value
  end

  def draw
    @window.draw_quad(
            @x * SIZE,       @y * SIZE, COLOR[@value],
      (@x + 1) * SIZE,       @y * SIZE, COLOR[@value],
            @x * SIZE, (@y + 1) * SIZE, COLOR[@value],
      (@x + 1) * SIZE, (@y + 1) * SIZE, COLOR[@value],
      0
    )
  end
end
