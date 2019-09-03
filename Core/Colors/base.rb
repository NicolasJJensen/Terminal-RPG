# frozen_string_literal: true

require 'curses'

#============= Colors =============#

# SHADES
Curses.init_color(1,  1000,    1000,   1000)               # White
Curses.init_color(2,  750,     750,    750 )               # Light Grey
Curses.init_color(3,  500,     500,    500 )               # Grey
Curses.init_color(4,  250,     250,    250 )               # Dark Grey
Curses.init_color(5,  0,       0,      0   )               # Black

# BASE
Curses.init_color(6,  1000,    0,      0   )               # Red
Curses.init_color(7,  1000,    500,    0   )               # Orange
Curses.init_color(8,  1000,    1000,   0   )               # Yellow
Curses.init_color(9,  500,     1000,   0   )               # Lime
Curses.init_color(10, 0,       1000,   0   )               # Green
Curses.init_color(11, 0,       1000,   500 )               # Jade
Curses.init_color(12, 0,       1000,   1000)               # Cyan
Curses.init_color(13, 0,       500,    1000)               # Sky
Curses.init_color(14, 0,       0,      1000)               # Blue
Curses.init_color(15, 500,     0,      1000)               # Purple
Curses.init_color(16, 1000,    0,      1000)               # Magenta
Curses.init_color(17, 1000,    0,      500 )               # Pink

# LIGHT
Curses.init_color(18, 1000,    333,    333 )               # Red
Curses.init_color(19, 1000,    666,    333 )               # Orange
Curses.init_color(20, 1000,    1000,   333 )               # Yellow
Curses.init_color(21, 666,     1000,   333 )               # Lime
Curses.init_color(22, 333,     1000,   333 )               # Green
Curses.init_color(23, 333,     1000,   666 )               # Jade
Curses.init_color(24, 333,     1000,   1000)               # Cyan
Curses.init_color(25, 333,     666,    1000)               # Sky
Curses.init_color(26, 333,     333,    1000)               # Blue
Curses.init_color(27, 666,     333,    1000)               # Purple
Curses.init_color(28, 1000,    333,    1000)               # Magenta
Curses.init_color(29, 1000,    333,    666 )               # Pink

# PASTEL
Curses.init_color(30, 1000,    666,    666 )               # Red
Curses.init_color(31, 1000,    833,    666 )               # Orange
Curses.init_color(32, 1000,    1000,   666 )               # Yellow
Curses.init_color(33, 833,     1000,   666 )               # Lime
Curses.init_color(34, 666,     1000,   666 )               # Green
Curses.init_color(35, 666,     1000,   833 )               # Jade
Curses.init_color(36, 666,     1000,   1000)               # Cyan
Curses.init_color(37, 666,     833,    1000)               # Sky
Curses.init_color(38, 666,     666,    1000)               # Blue
Curses.init_color(39, 833,     666,    1000)               # Purple
Curses.init_color(40, 1000,    666,    1000)               # Magenta
Curses.init_color(41, 1000,    666,    833 )               # Pink

# DARK
Curses.init_color(42, 666,     0,      0  )               # Red
Curses.init_color(43, 666,     333,    0  )               # Orange
Curses.init_color(44, 666,     666,    0  )               # Yellow
Curses.init_color(45, 333,     666,    0  )               # Lime
Curses.init_color(46, 0,       666,    0  )               # Green
Curses.init_color(47, 0,       666,    333)               # Jade
Curses.init_color(48, 0,       666,    666)               # Cyan
Curses.init_color(49, 0,       333,    666)               # Sky
Curses.init_color(50, 0,       0,      666)               # Blue
Curses.init_color(51, 333,     0,      666)               # Purple
Curses.init_color(52, 666,     0,      666)               # Magenta
Curses.init_color(53, 666,     0,      333)               # Pink

# DARKER
Curses.init_color(54, 333,     0,      0  )               # Red
Curses.init_color(55, 333,     166,    0  )               # Orange
Curses.init_color(56, 333,     333,    0  )               # Yellow
Curses.init_color(57, 166,     333,    0  )               # Lime
Curses.init_color(58, 0,       333,    0  )               # Green
Curses.init_color(59, 0,       333,    166)               # Jade
Curses.init_color(60, 0,       333,    333)               # Cyan
Curses.init_color(61, 0,       166,    333)               # Sky
Curses.init_color(62, 0,       0,      333)               # Blue
Curses.init_color(63, 166,     0,      333)               # Purple
Curses.init_color(64, 333,     0,      333)               # Magenta
Curses.init_color(65, 333,     0,      166)               # Pink

WHITE           = 1
GREY_LIGHT      = 2
GREY            = 3
GREY_DARK       = 4
BLACK           = 5

RED             = 6
ORANGE          = 7
YELLOW          = 8
LIME            = 9
GREEN           = 10
JADE            = 11
CYAN            = 12
SKY             = 13
BLUE            = 14
PURPLE          = 15
MAGENTA         = 16
PINK            = 17

RED_LIGHT       = 18
ORANGE_LIGHT    = 19
YELLOW_LIGHT    = 20
LIME_LIGHT      = 21
GREEN_LIGHT     = 22
JADE_LIGHT      = 23
CYAN_LIGHT      = 24
SKY_LIGHT       = 25
BLUE_LIGHT      = 26
PURPLE_LIGHT    = 27
MAGENTA_LIGHT   = 28
PINK_LIGHT      = 29

RED_PASTEL      = 30
ORANGE_PASTEL   = 31
YELLOW_PASTEL   = 32
LIME_PASTEL     = 33
GREEN_PASTEL    = 34
JADE_PASTEL     = 35
CYAN_PASTEL     = 36
SKY_PASTEL      = 37
BLUE_PASTEL     = 38
PURPLE_PASTEL   = 39
MAGENTA_PASTEL  = 40
PINK_PASTEL     = 41

RED_DARK        = 42
ORANGE_DARK     = 43
YELLOW_DARK     = 44
LIME_DARK       = 45
GREEN_DARK      = 46
JADE_DARK       = 47
CYAN_DARK       = 48
SKY_DARK        = 49
BLUE_DARK       = 50
PURPLE_DARK     = 51
MAGENTA_DARK    = 52
PINK_DARK       = 53

RED_DARKER      = 54
ORANGE_DARKER   = 55
YELLOW_DARKER   = 56
LIME_DARKER     = 57
GREEN_DARKER    = 58
JADE_DARKER     = 59
CYAN_DARKER     = 60
SKY_DARKER      = 61
BLUE_DARKER     = 62
PURPLE_DARKER   = 63
MAGENTA_DARKER  = 64
PINK_DARKER     = 65
