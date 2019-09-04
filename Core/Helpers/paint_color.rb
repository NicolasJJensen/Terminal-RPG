# frozen_string_literal: true

require 'curses'

def paint(win, color)
  win.attron(Curses.color_pair(color))
  yield
  win.attroff(Curses.color_pair(color))
end
