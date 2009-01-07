module Slider
  
  @@columns = 80
  @@rows = 24
  @@figlet_font = 'standard'  
  #COLUMNS = 105
  #ROWS    = 30
  VERTICAL_PADDING = 10
  #FIGLET_FONT = 'standard'

  def set_columns(c)
    @@columns = c
  end
  
  def set_rows(r)
    @@rows = r
  end
  
  def set_figlet_font(f)
    @@figlet_font = f
  end
  
  def slide(heading, *text)
    @slides ||= []
    @slides << [heading] + text
  end

  def start_slideshow
    @current_slide = 0

    while @current_slide < num_slides
      puts render_slide(*@slides[@current_slide])
      STDIN.getc
      @current_slide += 1
    end
  end

  private
  def render_slide(heading, *text)
    heading = `figlet -f #{@@figlet_font} #{heading}`
    width = heading.map { |line| line.length }.max
    padding = " " * ((@@columns - width) / 2)
    heading = heading.map { |line| "#{padding}#{line}" }
    heading_height = heading.size
    text = text.map { |line|
      padding = " " * ((@@columns - line.length) / 2)
      "#{padding}#{line}\n"
    }

    result = "\n" * VERTICAL_PADDING
    result << heading.join
    result << "\n"
    result << text.join
    result << "\n" * (@@rows - VERTICAL_PADDING - heading_height - text.size)
    result
  end

  def num_slides
    @slides.size
  end
end
