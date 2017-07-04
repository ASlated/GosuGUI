class Slider

  BLUE = Gosu::Color.rgb(78, 140, 216)
  LBLUE = Gosu::Color.rgb(175, 213, 246)
  WHITE = Gosu::Color.rgb(255, 255, 255)

  def initialize(window, x, y, length, max, scale = 1)
    @window = window
    @x = x
    @y = y
    @length = length
    @max = max
    @scale = scale
    @size = @scale * 100
    @hsize = @scale * 50
    @images = Gosu::Image.load_tiles('./slider.png', 100, 100)
    @pos = 0.5
    @dragging = false
    @value = @pos * @max
  end

  def clicked(mouse_x, mouse_y)
    if check_mouse(mouse_x, mouse_y, @x + @pos * @length - @hsize, @y, @x + @pos * @length + @hsize, @y + @size)
      @dragging = true
    end
  end

  def dragging(mouse_x)
    if @dragging
      if mouse_x < @x
        @pos = 0
      elsif mouse_x > @x + @length
        @pos = 1
      else
        @pos = (mouse_x - @x) / @length
      end
      @value = @pos * @max
    end
  end

  def value
    @value
  end

  def max
    @max
  end

  def draw
    @window.draw_quad(@x + @hsize, @y, BLUE, @x + @hsize + @pos * (@length - @size), @y, BLUE, @x + @hsize, @y + @size, BLUE, @x + @hsize + @pos * (@length - @size), @y + @size, BLUE, 4)
    @window.draw_quad(@x + @hsize, @y, WHITE, @x + @length - @hsize, @y, LBLUE, @x + @hsize, @y + @size, WHITE, @x + @length - @hsize, @y + @size, LBLUE, 3)
    @images[1].draw(@x, @y, 2, @scale, @scale)
    @images[2].draw(@x + @length - @size, @y, 2, @scale, @scale)
    @images[0].draw(@x + @pos * (@length - @size), @y, 5, @scale, @scale)
  end

  def check_mouse(mouse_x, mouse_y, x1, y1, x2, y2)
    if mouse_x > x1 && mouse_x < x2 && mouse_y > y1 && mouse_y < y2
      true
    else
      false
    end
  end

end
