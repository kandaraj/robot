require 'spec_helper'

describe Position do
  let(:position) { Position.new }
  let(:table) { double('table') }

  before :each do
    position.table = table	
  end

  it('successfully init position') do
    expect(position.current).to be_nil
  end

  it('successfully change the position') do
  	expect(table).to receive(:is_valid?).and_return(true)
  	coords = {:x=>1,:y=>1,:face=>:north}
    position.change(coords)
    expect(position.current).to eq coords
  end

  it('ignore position when it is invalid position') do
  	expect(table).to receive(:is_valid?).and_return(false)
  	coords = {:x=>1,:y=>1,:face=>:north}
    position.change(coords)
    expect(position.current).to be_nil
  end

  it('ignore on unknown direction') do
    expect(table).to receive(:is_valid?).and_return(true)
    position.change ({:x=>1,:y=>1,:face=>:something})
    expect(position.current).to be_nil
  end

  it('successfully move into the next available position : north') do
  	position.current_coordinates = {:x=>1,:y=>2,:face=>:north}
  	expect(table).to receive(:is_valid?).and_return(true)
  	expected_coords = {:x=>1,:y=>3,:face=>:north}
    position.move
    expect(position.current).to eq expected_coords
  end

  it('successfully move into the next available position : east') do
  	position.current_coordinates = {:x=>1,:y=>0,:face=>:east}
  	expect(table).to receive(:is_valid?).and_return(true)
  	expected_coords = {:x=>1,:y=>0,:face=>:south}
    position.turn(:right)
    position.move
    expect(position.current).to eq expected_coords
  end

  it('successfully move into the next available position : west') do
  	position.current_coordinates = {:x=>3,:y=>3,:face=>:west}
  	expect(table).to receive(:is_valid?).and_return(true)
  	expected_coords = {:x=>2,:y=>3,:face=>:west}
    position.move
    expect(position.current).to eq expected_coords
  end

  it('successfully move into the next available position : south') do
  	position.current_coordinates = {:x=>2,:y=>2,:face=>:south}
  	expect(table).to receive(:is_valid?).and_return(true)
  	expected_coords = {:x=>2,:y=>1,:face=>:south}
    position.move
    expect(position.current).to eq expected_coords
  end

  it('ignore move if the position is unavailable') do
  	position.current_coordinates = {:x=>0,:y=>0,:face=>:north}
  	expect(table).to receive(:is_valid?).and_return(false)
    position.move
    expect(position.current).to eq position.current_coordinates
  end

  it('should set into different direction') do
  	position.current_coordinates = {:x=>0,:y=>0,:face=>:north}
  	position.turn(:left)
  	expect(position.current[:face]).to be :west
  	position.turn(:right)
  	expect(position.current[:face]).to be :north
  	position.turn(:left)
  	position.turn(:left)
  	expect(position.current[:face]).to be :south
  	position.turn(:left)
  	expect(position.current[:face]).to be :east
  	position.turn(:left)
  	expect(position.current[:face]).to be :north
  	position.turn(:right)
  	expect(position.current[:face]).to be :east
  	position.turn(:right)
  	expect(position.current[:face]).to be :south
  	position.turn(:right)
  	expect(position.current[:face]).to be :west
  	position.turn(:right)
  	expect(position.current[:face]).to be :north
  end

  it('ignore the face if never placed') do
  	position.turn(:left)
  	expect(position.current).to be_nil
  end

  it('ignore on unknown face') do
  	position.current_coordinates = {:x=>0,:y=>0,:face=>:north}
  	position.turn(:what)
  	expect(position.current[:face]).to be :north
  end

end