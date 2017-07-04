require 'gosu'
require './slider'

class GameWindow < Gosu::Window

  C = Gosu::Color.rgba(0, 255, 128, 128)

  def initialize
    super(720, 480)
    self.caption = 'Input'
    @slider = Slider.new(self, 10, 10, 300, 1000, 0.5)
    @cursor = Gosu::Image.new(self, 'cursor.png')
    @font = Gosu::Font.new(16, {name: 'default'})
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
    @font.draw_rel(button_down?(Gosu::MsLeft), self.width - 10, self.height - 10, 6, 1, 1)
    @slider.draw
    # @cursor.draw(self.mouse_x, self.mouse_y, 6)
    draw_quad(self.mouse_x - 5, self.mouse_y - 5, C, self.mouse_x + 5, self.mouse_y - 5, C, self.mouse_x - 5, self.mouse_y + 5, C, self.mouse_x + 5, self.mouse_y + 5, C, 6)
  end

end

window = GameWindow.new
window.show
