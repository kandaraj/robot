
class Command
  attr :position

  def initialize()
    @position = Position.new
  end

  def go_to(rows,cols,face=nil)
  	face = 'north' if (rows == 0 && cols == 0)
    @position.change ({:x => rows, :y => cols, :face => face.to_sym}) if face
  end

  def move
    @position.move  
  end

  def turn(direction)
    @position.turn(direction.to_sym) 
  end

  def current_coordinates
    @position.current
  end

end