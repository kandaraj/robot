Toy Robot Simulator
===================

Description:
------------
  The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
	
Run
---
  I have tested with Ubuntu 14.04 64 bit, ruby 1.9.3 (I know, only realised after I have completed, it is my home laptop).
  I tried not to complicate this project.
  All it needs ruby and handful of commands to run.
  To run, `ruby run.rb` from the project directory. It takes stdin as commands.
  I have also included some test data in test_data/.
  To run, `cat test_data/test_data.txt | ruby run.rb`
  To run tests, you will need bundler and rspec (bundle install), and run 'rspec' from the root.


Algorithm
---------

Ok, this was just the start, the following have changed a bit since I started writing tests, but it got me going.

run.rb 
	takes command input or file

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
