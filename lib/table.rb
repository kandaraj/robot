
class Table
  attr_accessor :grid

  def initialize(rows,cols)
    @grid = Array.new(rows) { |i| Array.new(cols) { |i| 0 }}
  end

  def is_valid?(position)
  	valid = false
    valid = true if  @grid[position[:rows]] && @grid[position[:rows]][position[:cols]]
    valid
  end
 
end