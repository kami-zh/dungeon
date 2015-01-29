class Window < Gosu::Window
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
