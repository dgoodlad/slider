require 'slider'
include Slider

set_columns 105
set_rows 30
set_figlet_font 'bubble'

slide "Slider", "FIGlet is Cool!"
slide "Header", "Point 1", "Point 2", "Point 3"
slide "Simple?"
slide "Yes!"

start_slideshow
