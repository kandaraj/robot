require 'spec_helper'

describe Robot do

  let(:robot) { Robot.new }

  it('should have init robot')	do 
    expect(robot.coordinates).to be_nil
  end

  it('should make the robot move') do
  	robot.go_to(0,0)
  	expected = {:x => 0, :y => 0, :face => :north}
  	expect(robot.coordinates).to eq expected
  end

  it('should ')

end