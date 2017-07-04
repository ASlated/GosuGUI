# Ruby Gosu Slider

Pretty rough draft of a GUI tool for the Gosu 2D game library.

## Usage

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
