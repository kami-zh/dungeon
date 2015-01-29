class Menu
  def initialize(window)
    @window = window
  end

  def draw
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.mode = :map
    end
  end
end
