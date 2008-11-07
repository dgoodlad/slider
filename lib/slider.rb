module Slider
  COLUMNS = 80
  ROWS    = 24
  VERTICAL_PADDING = 10
  FIGLET_FONT = 'standard'

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
    heading = `figlet -f #{FIGLET_FONT} #{heading}`
    width = heading.map { |line| line.length }.max
    padding = " " * ((COLUMNS - width) / 2)
    heading = heading.map { |line| "#{padding}#{line}" }
    heading_height = heading.size
    text = text.map { |line|
      padding = " " * ((COLUMNS - line.length) / 2)
      "#{padding}#{line}\n"
    }

    result = "\n" * VERTICAL_PADDING
    result << heading.join
    result << "\n"
    result << text.join
    result << "\n" * (ROWS - VERTICAL_PADDING - heading_height - text.size)
    result
  end

  def num_slides
    @slides.size
  end
end
