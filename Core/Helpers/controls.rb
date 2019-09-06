# frozen_string_literal: true

require 'curses'

# Config file for the default controls

CONTROLS = [
  { name: 'Up', control: Curses::KEY_UP },
  { name: 'Down', control: Curses::KEY_DOWN },
  { name: 'Left', control: Curses::KEY_LEFT },
  { name: 'Right', control: Curses::KEY_RIGHT },
  { name: 'Enter', control: 10 },
  { name: 'Move Up', control: Curses::KEY_UP },
  { name: 'Move Down', control: Curses::KEY_DOWN },
  { name: 'Move Left', control: Curses::KEY_LEFT },
  { name: 'Move Right', control: Curses::KEY_RIGHT }
].freeze
