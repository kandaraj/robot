require_relative 'command'

class Robot
  attr :command

  def initialize
    @command = Command.new  
  end

  def go_to(rows,cols,face=nil)
    @command.go_to(rows,cols,face)
  end

  def move_next
    @command.move
  end

  def turn_left
    @command.turn(:left)
  end 

  def turn_right
    @command.turn(:right)
  end

  def coordinates
    @command.current_coordinates
  end

end