require 'spec_helper'

describe Command do

  let(:command) { Command.new }

  it('should have init robot')	do 
    expect(command.current_coordinates).to be_nil
  end

  it('should make robot to go to place') do
  	command.go_to(1,3,'north')
  	expected = {:x => 1, :y => 3, :face => :north}
  	expect(command.current_coordinates).to eq expected
  end

  it('should make robot to go to place with default to north') do
  	command.go_to(0,0)
  	expected = {:x => 0, :y => 0, :face => :north}
  	expect(command.current_coordinates).to eq expected
  end

  it('should ignore the command if invalid face') do
  	command.go_to(1,2,nil)
  	expect(command.current_coordinates).to be_nil
  end

  it('should move the robot') do
  	command.go_to(1,3,'north')
  	command.move
  	expected = {:x => 1, :y => 4, :face => :north}
  	expect(command.current_coordinates).to eq expected
  end

  it('should turn the robot') do
  	command.go_to(1,3,'north')
  	command.turn('left')
  	expected = {:x => 1, :y => 3, :face => :west}
  	expect(command.current_coordinates).to eq expected
  	command.turn('right')
  	expected = {:x => 1, :y => 3, :face => :north}
  	expect(command.current_coordinates).to eq expected
  	command.turn('right')
  	command.turn('right')
  	command.turn('right')
  	command.turn('right')
  	expect(command.current_coordinates).to eq expected
  end

  it('should fail if goes out of area') do
  	command.go_to(5,5,'north')
  	command.turn('left')
  	expect(command.current_coordinates).to be_nil 
  end

  it('should move robot to right area') do
  	command.go_to(0,0)
  	command.turn('right')
  	command.move
  	expected = {:x => 1, :y => 0, :face => :east}
  	expect(command.current_coordinates).to eq expected
  	command.turn('right')
  	command.move
  	expected = {:x => 1, :y => 0, :face => :south}
  	expect(command.current_coordinates).to eq expected
  end

end