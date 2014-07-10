require_relative 'table'

class Position
  attr_accessor :table, :current_coordinates, :faces, :next_moves

  def initialize 
    @table = Table.new(5,5)  
    @current_coordinates = nil
    @next_moves = {
    		:x => {:west => -1, :east => 1, :north => 0, :south => 0},
            :y => {:north => 1, :south => -1, :west => 0, :east => 0}
          }
    @faces = {
        :left => {:north => :west, :west => :south, :south => :east, :east => :north},
        :right => {:north => :east, :east => :south, :south => :west, :west => :north}
      }
  end

  def current 
    @current_coordinates    
  end

  def change(coordinates)
    if @table.is_valid?(coordinates) && @faces[:left][coordinates[:face]]
    	@current_coordinates = { 
        :x => coordinates[:x] < 0 ? 0 : coordinates[:x] , 
        :y => coordinates[:y] < 0 ? 0 : coordinates[:y], 
        :face => coordinates[:face]  
        }
    end  
  end

  def move
    if current 
      new_x = current[:x] + @next_moves[:x][current[:face]]
      new_y = current[:y] + @next_moves[:y][current[:face]]
      change({:x=>new_x,:y=>new_y,:face=>current[:face]})
    end
  end

  def turn(direction)
    current_coordinates[:face] = @faces[direction][current_coordinates[:face]] if @faces[direction] && current
  end


end