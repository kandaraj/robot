# A simple table to define the table for robot to move around

class Table
  attr_reader :grid, :x, :y

  # init the table with rows and cols
  def initialize(rows,cols)
  	@rows = rows
  	@cols = cols
    @grid = Array.new(@rows) { |i| Array.new(@cols) { |i| 0 }}
  end

  # check if the coordinates can fit into the table
  def is_valid?(position)
	  (position[:x] < 0 || position[:y] < 0 || position[:x] >= @rows || position[:y] >= @cols) ? false : true
  end
 
end