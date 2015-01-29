require 'gosu'

class GameWindow < Gosu::Window
  attr_reader :map

  def initialize
    super(480, 480, false)

    self.caption = 'Dungeon Game'

    @map    = Map.new(self)
    @player = Player.new(self)
  end

  def draw
    @map.draw
    @player.draw
  end

  def update
  end

  def button_down(id)
    @player.button_down(id)
  end
end

class Player
  def initialize(window)
    @window = window
    @x = 0
    @y = 0
  end

  def draw
    tile = @window.map.tile(@x, @y, 2)
    tile.draw
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

class Map
  # TODO: Load from other file
  TILE_LAYOUT = [
    [1, 1, 1, 1, 1],
    [1, 0, 0, 0, 1],
    [1, 1, 1, 1, 1],
    [1, 0, 0, 0, 1],
    [1, 1, 1, 1, 1]
  ]

  def initialize(window)
    @window = window
    @layout = TILE_LAYOUT # TODO: Switch depending on player level
  end

  def draw
    y = 0
    @layout.each do |row|
      x = 0
      row.each do |value|
        tile(x, y, value).draw
        x += 1
      end
      y += 1
    end
  end

  def tile(x, y, value)
    Tile.new(@window, x, y, value)
  end

  def passable?(x, y)
    return false if poke?(x, y)

    @layout[y][x] == 1 ? true : false
  end

  private

  def poke?(x, y)
    return true if x < 0 || y < 0
    return true unless defined?(@layout[y][x])

    false
  end
end

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

window = GameWindow.new
window.show
