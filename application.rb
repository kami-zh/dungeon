require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super(640, 480, false)

    self.caption = 'Gosu Sample'

    @character = Character.new(self)
  end

  def draw
    @character.draw
  end

  def update
    @character.update
  end
end

class Character
  def initialize(window)
    @window = window

    @x = 0
    @y = 0

    @image = Gosu::Image.new(@window, 'assets/images/character.png', false)
  end

  def draw
    @image.draw_rot(@x, @y, 0, 0)
  end

  def update
    move_up    if @window.button_down? Gosu::KbUp
    move_down  if @window.button_down? Gosu::KbDown
    move_right if @window.button_down? Gosu::KbRight
    move_left  if @window.button_down? Gosu::KbLeft
  end

  def move_up
    @y -= 1
  end

  def move_down
    @y += 1
  end

  def move_right
    @x += 1
  end

  def move_left
    @x -= 1
  end
end

window = GameWindow.new
window.show
