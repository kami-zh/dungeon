class Window < Gosu::Window
  attr_reader :map
  attr_reader :player

  attr_writer :mode

  def initialize
    super(480, 480, false)

    self.caption = 'Dungeon'

    @mode = :start

    @start  = Start.new(self)
    @map    = Map.new(self)
    @menu   = Menu.new(self)
    @player = Player.new(self)
  end

  def draw
    case @mode
    when :start
      @start.draw
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
    when :start
      @start.button_down(id)
    when :map
      @map.button_down(id)
      @player.button_down(id)
    when :menu
      @menu.button_down(id)
    end
  end
end
