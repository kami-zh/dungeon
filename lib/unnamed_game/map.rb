class Map
  # TODO: Load from other file
  TILE_LAYOUT = [
    [1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 0, 1, 1, 1, 1, 1, 0, 1],
    [1, 0, 1, 0, 0, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 1, 1, 0, 1, 0, 1],
    [1, 0, 0, 0, 0, 0, 1, 0, 1],
    [1, 1, 1, 1, 1, 1, 1, 0, 1]
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

  def offset_x
    (@window.width - (TILE_LAYOUT.map(&:size).max * Tile::SIZE)) / 2
  end

  def offset_y
    (@window.height - (TILE_LAYOUT.size * Tile::SIZE)) / 2
  end

  private

  def poke?(x, y)
    return true if x < 0 || y < 0
    return true unless defined?(@layout[y][x])

    false
  end
end
