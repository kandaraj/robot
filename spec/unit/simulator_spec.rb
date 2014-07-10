describe Simulator do
  
  let(:simulator) { Simulator.new }

  it('should take place command and place the robot') do
    p simulator.execute('Place 0,0,north')    
  end

end