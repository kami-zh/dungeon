require 'gosu'

class GameWindow < Gosu::Window
  def initialize
    super(640, 480, false)

    self.caption = 'Gosu Sample'

    @x = 0
    @y = 0

    @character = Gosu::Image.new(self, 'assets/images/character.png', false)
  end

  def draw
    @character.draw_rot(@x, @y, 0, 0)
  end

  def update
    @x += 1 if button_down? Gosu::KbRight
    @x -= 1 if button_down? Gosu::KbLeft
    @y += 1 if button_down? Gosu::KbDown
    @y -= 1 if button_down? Gosu::KbUp
  end
end

window = GameWindow.new
window.show
