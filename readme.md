# Ruby Gosu Slider

Pretty rough draft of a GUI tool for the Gosu 2D game library.

## Usage of slider.rb

```
Slider.new(window, x, y, length, max, scale = 1)
window - The Gosu Window of the slider.
x, y - The initial x and y positions of the slider.
length - The display length of the slider.
max - The value when dragged all the way to the right. The left side has a value of zero.
scale - The scale of the slider, manipulating height AND width.
```

As shown below, the current value and maximum value of the slider can be retrieved through methods.

```
my_slider = Slider.new(self, 0, 0, 300, 50)
my_slider.length => 150
my_slider.max => 300
```

## Usage of slider_2.rb

### Creation
```
Slider.new(window, x, y, z, length, max, min: 0, pos: 0.0, markers: 0, color: C, text: true)
```

### Slider Arguments
```
window - The Gosu Window of the slider.
x, y - The initial x and y positions of the slider.
z - The z position of the slider (determines which objects it will display in front of.)
length - The display length of the slider.
max - The value when dragged all the way to the right.
min - The value when dragged all the way to the left.
pos - The default position of the selector. 0 is the very left and 1 is the very right.
markers - The number of markers along the line bar.
color - The color of the slider. Affects the selector, bar, and text.
text - Whether or not to display the text.
```

### Retrieving Information
```
my_slider = Slider.new(self, 30, 10, 0, 200, 50, pos: 0.2)
my_slider.value => 10
my_slider.min => 0
my_slider.max => 50
```
