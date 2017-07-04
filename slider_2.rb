class SliderAlt

  PWIDTH = 20
  QHEIGHT = 15
  THEIGHT = 10
  PHEIGHT = QHEIGHT + THEIGHT
  MARGIN = 5
  LHEIGHT = 5

  C = Gosu::Color.rgb(128, 128, 128)
  FONT_SIZE = 20

  def initialize(window, x, y, z, length, max, options = {min: 0, pos: 0.0, tick_marks: 0, color: C})
    @window = window
    @x, @y, @z = x, y, z
    @length = length
    @max = max
    @options = options
    @value = @options[:pos] * @max
    @dragging = false
    @font = Gosu::Font.new(FONT_SIZE, {name: 'slider_font'})
    @pointerx = @x + @options[:pos] * @length - PWIDTH / 2
    @poxntery = @y + MARGIN + LHEIGHT
  end

  def update
    @options[:pos] = rand(10) / 10.0
    @value = @options[:pos] * @max
    @pointerx = @x + @options[:pos] * @length - PWIDTH / 2
    @poxntery = @y + MARGIN + LHEIGHT
  end

  def draw_pointer
    x = @pointerx
    y = @pointery
    @window.draw_quad(x, y - PHEIGHT, @options[:color], x + PWIDTH, y - PHEIGHT, @options[:color], x, y - THEIGHT, @options[:color], x + PWIDTH, y - THEIGHT, @options[:color], @z)
    @window.draw_triangle(x, y - THEIGHT, @options[:color], x + PWIDTH / 2, y, @options[:color], x + PWIDTH, y - THEIGHT, @options[:color], @z)
  end

  def draw_bar
    @window.draw_quad(@x, @y, @options[:color], @x + @length, @y, @options[:color], @x, @y + LHEIGHT, @options[:color], @x + @length, @y + LHEIGHT, @options[:color], @z)
  end

  def draw_text
    @font.draw(@options[:min].round, @x, @y + LHEIGHT + MARGIN, @z, 1, 1, @options[:color])
    @font.draw_rel(@max.round, @x + @length, @y + LHEIGHT + MARGIN, @z, 1, 0, 1, 1, @options[:color])
    @font.draw_rel(@value.round, @x + @length, @y - MARGIN - QHEIGHT, @z, 1, 1, 1, 1, @options[:color])
  end

  def draw(text = true)
    draw_pointer
    draw_bar
    draw_text if text
  end

  def check_mouse(mouse_x, mouse_y, x1, y1, x2, y2)
    if mouse_x > x1 && mouse_x < x2 && mouse_y > y1 && mouse_y < y2
      true
    else
      false
    end
  end

end
