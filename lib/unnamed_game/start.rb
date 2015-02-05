class Start
  TEXT = <<-TEXT
    Return: Start

    L: Load
  TEXT

  def initialize(window)
    @window = window
  end

  def draw
    text.draw_rot(240, 240, 0, 0)
  end

  def button_down(id)
    case id
    when Gosu::KbReturn
      @window.mode = :map
    when Gosu::KbL
      Command::Load.new(@window).call
      @window.mode = :map
    end
  end

  private

  def text
    @text ||= Gosu::Image.from_text(@window, TEXT, 'Helvetica Neue', 24)
  end
end
