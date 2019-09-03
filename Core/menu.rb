# frozen_string_literal: true

# Base class for menu control
class Menu
  attr_reader :title, :options
  attr_accessor :current_index

  def initialize(items, title)
    @title = title
    @options = items
    @current_index = 0
  end

  def draw_table(win, pos)
    max_length = @options.map(&:length).max
    win.addstr(@title)
    win.addstr('-' * max_length)

    @options.map.with_index do |option, i|
      win.pos_set(pos.y + i, pos.x)
      # set_color if i == @current_index
      win.addstr("#{option}\n")
    end.join("\n")
  end

  def current_option
    @options[@current_index]
  end
end

class MainMenu < Menu
  def initialize(title)
    super(%w[Start Controls Help About Exit], title)
  end
end

class LevelMenu < Menu
  def initialize(levels)
    super
  end
end
