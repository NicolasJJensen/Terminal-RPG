# frozen_string_literal: true

require 'curses'

# This is a function used when drawing to the screen
# runs some code but applies a color before the drawing begins
# then turns of that color when the drawing is finished

def paint(win, color)
  win.attron(Curses.color_pair(color))
  yield
  win.attroff(Curses.color_pair(color))
end
