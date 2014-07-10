robot
=====

A toy robot simulator for a ruby challange

Design
======

run.rb
	- Simulator
		- ref Robot (@table)
			- ref Command
		- ref Position

Algorithm
=========

run.rb file_commands.txt
	(or) takes command input

	simulator = Simulator.new
	simulator.execute(command)


Simulator.rb
	attr: robot

	def initialise()
		robot = Robot.new()

	def execute(command)
		case command.token
		when place
			robot.go_to(x,y)
		when move
			robot.move_next()
		when left
			robot.turn_left()
		when right
			robot.turn_right
		when report
			robot.coordinates


Robot.rb 

	def go_to(rows,cols)
		command.go_to(rows_cols)

	def move_next()
		command.move

	def turn_left()
		command.turn(:left)

	def turn_right()
		command.turn(:right)

	def coordinates
		command.current_coordinates

Command.rb

	def initialise()
		position = Position.new

	def go_to(rows,cols,face)
		position.change ({rows, cols, face})

	def move
		position.move  

	def turn(direction)
		position.turn(direction) 

	def current_coordinates
		position.current

Position.rb
 
	def initialise()
		table = Table.new(5,5)	
		current_coordinates = nil
		face = :north
		next_moves = {:x => {:west => -1, :east => 1, :north => 0, :south => 0},
						:y => {:north => 1, :south => -1, :west => 0, :east => 0}
					}
		faces = {
				:left => {:north => :west, :west => :south, :south => :east, :east => :north},
				:right => {:north => :east, :east => :south, :south => :west, :west => :north}
			}

	def current
		current_coordinates		

	def change(coordinates)
		current = { :x => coordinates[:x], 
					:y => coordinates[:y], 
					:face => coordinates[:face] || :north 
				}  if table.is_valid(coordinates)

	def move
		if current 
			new_row = current[rows] + next_moves[:x[current[:face]]]
			new_col = current[cols] + next_moves[:y[current[:face]]]
			change({:x=>new_row,:y=>new_col,:face=>current[:face]})
		end

	def turn(direction)
		current[:face] = faces[direction[:current[:face]] if current


Table.rb
 
 	def initialise(rows,cols)
		grid = Array.new(rows) { |i| Array.new(cols) { |i| 0 }}

	def is_valid?(position)
		return true if grid[position[:x]] && grid[position[:x]][position[:y]]
