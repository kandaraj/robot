require 'spec_helper'

describe Simulator do
  
  let(:simulator) { Simulator.new }

  it('should take place command and place the robot') do
    result = simulator.execute('Place 0,0,north')    
  end

  it('should ignore for invalid direction') do
    result = simulator.execute('Place 0,0')    
    expect(result).to be_nil
  end

  it('should ignore for invalid coordinates') do
    result = simulator.execute('Place 0,g,north')    
    expect(result).to be_nil
  end

  it('should gets a coordinates') do
  	result = simulator.execute('PLACE 0,0,east')
  	expect(result).to be_nil
  end

  it('should gets a error for invalid position') do
  	result = simulator.coordinates('place a,b,east')
  	expect(result).to include('invalid command')
  end

  it('should gets a error for invalid direction') do
  	result = simulator.coordinates('place 1,1')
  	expect(result).to include('invalid command')
  end

  it('should gets a face for 0,0') do
  	result = simulator.coordinates('place 0,0')
  	expect(result).to eq ({:x => 0, :y => 0, :face => "north"})
  end

  it('should move the robot') do
  	simulator.execute('Place 0,0,north') 
  	result = simulator.execute('move')
	expect(result).to be_nil
  end

  it('should turn left') do
  	simulator.execute('Place 1,3,north') 
  	result = simulator.execute('left')
	expect(result).to be_nil
  end

  it('should turn right') do
  	simulator.execute('Place 1,3,north') 
  	result = simulator.execute('right')
	expect(result).to be_nil
  end

  it('should report robot position') do
  	simulator.execute('Place 1,3,north') 
  	result = simulator.execute('report')
	expect(result).to eq "Output: 1,3,NORTH"
  end

  it('should report nil for robot position') do
  	result = simulator.execute('report')
	expect(result).to include 'no report'
  end


end 