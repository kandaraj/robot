require_relative 'robot'

class Simulator
  attr :robot

  def initialize
    @robot = Robot.new  
  end

  def execute(commands)
    command = commands.split
    output = nil
	case command[0].to_s.downcase 

	when 'place'
	  c = coordinates(commands)
	  robot.go_to(c[:x],c[:y],c[:face]) if c.is_a?(Hash)

	when 'move'
	  robot.move_next

	when 'left'
	  robot.turn_left

	when 'right'
	  robot.turn_right

	when 'report'
	  result = robot.coordinates
	  output = result ? "Output: #{result[:x]},#{result[:y]},#{result[:face].upcase}" : "no report"

	else
	  output = 'Error: invalid command'
    end
    output
  end

  def coordinates(commands)
  	begin
	  command = commands.split
	  coord = command[1].split(',')
	  x = Integer(coord[0]) 
	  y = Integer(coord[1]) 
	  face = 'north' if coord[2].nil? && x == 0 && y == 0	  	
	  face = coord[2].to_s.downcase if face.nil? && coord[2].length > 0
	  {:x=>x,:y=>y,:face=>face}
  	rescue Exception => e
  	  "invalid command #{e.message}"
  	end

  end
end