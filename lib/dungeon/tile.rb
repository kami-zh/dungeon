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
      offset_x + @x * SIZE,       offset_y + @y * SIZE,       COLOR[@value],
      offset_x + (@x + 1) * SIZE, offset_y + @y * SIZE,       COLOR[@value],
      offset_x + @x * SIZE,       offset_y + (@y + 1) * SIZE, COLOR[@value],
      offset_x + (@x + 1) * SIZE, offset_y + (@y + 1) * SIZE, COLOR[@value],
      0
    )
  end

  private

  def offset_x
    @window.map.offset_x
  end

  def offset_y
    @window.map.offset_y
  end
end
