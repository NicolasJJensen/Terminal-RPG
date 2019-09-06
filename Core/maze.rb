# frozen_string_literal: true

# Maze class that can create a grid maze
# with a width and height of your choice
class Maze
  attr_accessor :grid

  # initializes the Maze with an empty array of nil values
  def initialize(width, height)
    @grid = Array.new(height) { Array.new(width) }
    create_maze(0, 0, 3)
  end

  # recursize backtracking function to create the maze
  def create_maze(row, col, direction)
    curr_cell = Cell.new
    @grid[row][col] = curr_cell

    curr_cell.walls[direction] = false

    directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    4.times do
      index = rand(directions.length)
      direction = directions.delete_at(index)
      direction_from =
        case direction
        when [0, 1]
          0
        when [0, -1]
          2
        when [1, 0]
          3
        when [-1, 0]
          1
        end

      direction_to =
        case direction
        when [0, 1]
          2
        when [0, -1]
          0
        when [1, 0]
          1
        when [-1, 0]
          3
        end
      new_row = row + direction[0]
      new_col = col + direction[1]

      unless new_row.negative? ||
             new_col.negative? ||
             new_row >= @grid.length ||
             new_col >= @grid[0].length ||
             @grid[new_row][new_col]

        curr_cell.walls[direction_to] = false
        create_maze(new_row, new_col, direction_from)
      end
    end
  end
end

# Cell to keep track of which directions of each cell are "open"
class Cell
  attr_accessor :walls

  def initialize
    @walls = [true, true, true, true]
  end
end
