require_relative '../maze'
require_relative '../vector'

def build_maze(x, y, wall, cell_size)
  terrain = []
  maze = Maze.new(x, y)

  wall_tiling = (cell_size / wall.width)

  maze.grid.each.with_index do |row, i|
    row.each.with_index do |cell, j|
      wall_tiling.times do |k|
        if cell.walls[0]
          new_wall = wall.dup
          new_wall.pos = Vector.new(:x => i * cell_size + k * wall.width, :y => j * cell_size)
          terrain << new_wall
        end
        if cell.walls[1]
          new_wall = wall.dup
          new_wall.pos = Vector.new(:x => i * cell_size + cell_size, :y => j * cell_size + k * wall.width)
          terrain << new_wall
        end
        if cell.walls[2]
          new_wall = wall.dup
          new_wall.pos = Vector.new(:x => i * cell_size + k * wall.width, :y => j * cell_size + cell_size)
          terrain << new_wall
        end
        if cell.walls[3]
          new_wall = wall.dup
          new_wall.pos = Vector.new(:x => i * cell_size, :y => j * cell_size + k * wall.width)
          terrain << new_wall
        end
      end
    end
  end

  terrain
end
