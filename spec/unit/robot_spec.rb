require 'spec_helper'

describe Robot do

  let(:robot) { Robot.new }

  it('should have init robot')	do 
    expect(robot.coordinates).to be_nil
  end

  it('should not push robot out') do
  	robot.go_to(0,0)
  	robot.turn_left
  	robot.move_next
  	expected = {:x => 0, :y => 0, :face => :west}
  	expect(robot.coordinates).to eq expected
  end

  it('should make the robot move left') do
  	robot.go_to(3,2,'north')
  	robot.turn_left
  	robot.move_next
  	expected = {:x => 2, :y => 2, :face => :west}
  	expect(robot.coordinates).to eq expected
  end

  it('should make the robot move right') do
  	robot.go_to(3,2,'north')
  	robot.turn_right
  	robot.move_next
  	expected = {:x => 4, :y => 2, :face => :east}
  	expect(robot.coordinates).to eq expected
  end
end