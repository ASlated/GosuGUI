require 'gosu'
require './slider'
require './slider_2'

class GameWindow < Gosu::Window

  C = Gosu::Color.rgba(0, 255, 128, 128)
  WHITE = Gosu::Color.rgb(255, 255, 255)

  def initialize
    super(1280, 720, false)
    self.caption = 'Input'
    @slider = Slider.new(self, 10, 40, 300, 50, 0.5)
    @slider_2 = SliderAlt.new(self, 50, 300, 0, 400, 100, min: 0, pos: 0.5, color: WHITE, markers: 3)
    @font = Gosu::Font.new(16, {name: 'default'})
  end

  def needs_cursor?; true; end

  def button_down(id)
    case id
    when Gosu::KbEscape
      close
    end
  end

  def update
    # if button_down?(Gosu::MsLeft)
    #   @slider.clicked(self.mouse_x, self.mouse_y)
    # else
    #   @slider.instance_variable_set(:@dragging, false)
    # end
    # @slider.dragging(mouse_x)
    @slider_2.update
  end

  def draw
    # @font.draw("#{@slider.value.to_i}/#{@slider.max}", 10, 10, 6)
    # @slider.draw
    @slider_2.draw
  end

end

window = GameWindow.new
window.show
