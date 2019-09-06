require_relative 'animation_test'
require_relative 'circle_test'
require_relative 'game_object_test'
require_relative 'game_test'
require_relative 'line_test'
require_relative 'menu_test'
require_relative 'n_sided_shape_test'
require_relative 'raw_graphic_test'
require_relative 'shape_test'
require_relative 'sprite_test'
require_relative 'vector_test'

Dir[File.dirname(File.absolute_path(__FILE__)) + '/**/*_test.rb'].each {|file| require file }