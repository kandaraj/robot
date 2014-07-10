
class Position
  attr_accessor :table, :current_coordinates, :faces, :next_moves

  def initialize 
    @table = Table.new(5,5)  
    @current_coordinates = nil
    @next_moves = {
    		:row => {:west => 0, :east => 1, :north => 0, :south => -1},
            :col => {:north => 1, :south => 0, :west => -1, :east => 0}
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
    if @table.is_valid?(coordinates) 
    	@current_coordinates = { :rows => coordinates[:rows], 
        :cols => coordinates[:cols], 
        :face => coordinates[:face] || :north 
        }
    end  
  end

  def move
    if current 
      new_row = current[:rows] + @next_moves[:row][current[:face]]
      new_col = current[:cols] + @next_moves[:col][current[:face]]
      change({:rows=>new_row,:cols=>new_col,:face=>current[:face]})
    end
  end

  def turn(direction)
    current_coordinates[:face] = @faces[direction][current_coordinates[:face]] if @faces[direction] && current
  end


end