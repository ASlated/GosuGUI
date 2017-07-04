class SliderAlt

  PWIDTH = 20
  QHEIGHT = 15
  THEIGHT = 10
  PHEIGHT = QHEIGHT + THEIGHT
  MARGIN = 5
  LHEIGHT = 5

  C = Gosu::Color.rgb(128, 128, 128)
  FONT_SIZE = 20

  def initialize(window, x, y, z, length, max, min: 0, pos: 0.0, markers: 0, color: C, text: true)
    @window = window
    @x, @y, @z = x, y, z
    @length = length
    @max, @min = max, min
    @pos = pos
    @markers = markers
    @color = color
    @text = text
    @dragging = false
    @font = Gosu::Font.new(FONT_SIZE, {name: 'slider_font'})
    @pointerx = @x + @pos * @length - PWIDTH / 2
    @pointery = @y + MARGIN + LHEIGHT
    @dir = 'up'
  end

  def value
    (@max - @min) * @pos + @min
  end

  def max
    @max
  end

  def update
    if @dir == 'up'
      unless @pos >= 1
        @pos += 0.01
      else
        @dir = 'down'
        @pos -= 0.01
      end
    else
      unless @pos <= 0
        @pos -= 0.01
      else
        @dir = 'up'
        @pos += 0.01
      end
    end
    @pointerx = @x + @pos * @length - PWIDTH / 2
    @pointery = @y + MARGIN + LHEIGHT
  end

  def draw_pointer
    x, y = @pointerx, @pointery
    @window.draw_quad(x, y - PHEIGHT, @color, x + PWIDTH, y - PHEIGHT, @color, x, y - THEIGHT, @color, x + PWIDTH, y - THEIGHT, @color, @z)
    @window.draw_triangle(x, y - THEIGHT, @color, x + PWIDTH / 2, y, @color, x + PWIDTH, y - THEIGHT, @color, @z)
  end

  def draw_bar
    @window.draw_quad(@x, @y, @color, @x + @length, @y, @color, @x, @y + LHEIGHT, @color, @x + @length, @y + LHEIGHT, @color, @z)
  end

  def draw_text
    @font.draw(@min.round, @x, @y + LHEIGHT + MARGIN, @z, 1, 1, @color)
    @font.draw_rel(@max.round, @x + @length, @y + LHEIGHT + MARGIN, @z, 1, 0, 1, 1, @color)
    @font.draw_rel(value.round, @x + @length, @y - MARGIN - QHEIGHT, @z, 1, 1, 1, 1, @color)
  end

  def draw
    draw_pointer
    draw_bar
    draw_text if @text
  end

  def check_mouse(mouse_x, mouse_y, x1, y1, x2, y2)
    if mouse_x > x1 && mouse_x < x2 && mouse_y > y1 && mouse_y < y2
      true
    else
      false
    end
  end

end
