class Simulator
  attr :robot

  def initialize
    @robot = Robot.new  
  end

  def execute(commands)
    command = commands.split

	case command[0].to_s.downcase 
	when 'place'
	  coord = command[1].split(',')
	  x = coord[0].to_i
	  y = coord[1].to_i
	  face = coord[2].to_s
	  robot.go_to(x,y,face)

	when 'move'
	  robot.move_next

	when 'left'
	  robot.turn_left

	when 'right'
	  robot.turn_right

	when 'report'
	  robot.coordinate

	else
	  puts 'invalid command'
    end
    robot.coordinates
  end

end