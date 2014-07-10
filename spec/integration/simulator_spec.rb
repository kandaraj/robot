require 'spec_helper'

describe Simulator do
  
  let(:simulator) { Simulator.new }

  context 'Sample test 1' do
    it('should run sample test and output expected result') do
      simulator.execute('PLACE 1,2,EAST')
      simulator.execute('MOVE')
      simulator.execute('MOVE')
      simulator.execute('LEFT')
      simulator.execute('MOVE')
      result = simulator.execute('REPORT')
      expect(result).to eq 'Output: 3,3,NORTH'
    end
  end

  context 'Sample test 2' do
    it('should run sample test and output expected result') do
	  simulator.execute('PLACE 0,0,NORTH')
	  simulator.execute('Move')
	  result = simulator.execute('Report')
	  expect(result).to eq 'Output: 0,1,NORTH'
    end 
  end

  context 'Sample test 3' do
    it('should run sample test and output expected result') do
	  simulator.execute('PLACE 0,0')
	  simulator.execute('LEFT')
	  result = simulator.execute('REPORT')
	  expect(result).to eq 'Output: 0,0,WEST'
    end 
  end

end