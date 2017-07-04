require 'gosu'
require './slider'

class GameWindow < Gosu::Window

  C = Gosu::Color.rgba(0, 255, 128, 128)

  def initialize
    super(720, 480)
    self.caption = 'Input'
    @slider = Slider.new(self, 10, 40, 300, 50, 0.5)
    @font = Gosu::Font.new(16, {name: 'default'})
  end

  def needs_cursor?
    true
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      close
    end
  end

  def update
    if button_down?(Gosu::MsLeft)
      @slider.clicked(self.mouse_x, self.mouse_y)
    else
      @slider.instance_variable_set(:@dragging, false)
    end
    @slider.dragging(mouse_x)
  end

  def draw
    @font.draw("#{@slider.value.to_i}/#{@slider.max}", 10, 10, 6)
    @slider.draw
  end

end

window = GameWindow.new
window.show
