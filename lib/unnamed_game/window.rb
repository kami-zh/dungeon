class Window < Gosu::Window
  attr_reader :map

  attr_writer :mode

  def initialize
    super(480, 480, false)

    self.caption = 'Unnamed Game'

    @mode = :map

    @map    = Map.new(self)
    @menu   = Menu.new(self)
    @player = Player.new(self)
  end

  def draw
    case @mode
    when :map
      @map.draw
      @player.draw
    when :menu
      @menu.draw
    end
  end

  def update
  end

  def button_down(id)
    case @mode
    when :map
      @map.button_down(id)
      @player.button_down(id)
    when :menu
      @menu.button_down(id)
    end
  end
end
