
class Table
  attr_reader :grid, :rows, :cols

  # init the table with rows and cols
  def initialize(rows,cols)
  	@rows = rows
  	@cols = cols
    @grid = Array.new(@rows) { |i| Array.new(@cols) { |i| 0 }}
  end

  # check if the coordinates can fit into the table
  def is_valid?(position)
	  (position[:rows] < 0 || position[:cols] < 0 || position[:rows] >= @rows || position[:cols] >= @cols) ? false : true
  end
 
end