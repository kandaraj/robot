require 'spec_helper'

describe Table do
  
  let(:table) { Table.new(5,5) }

  before :each do
  	
  end	 

  xit('should be true if the ordinates') do
  	expect(table.is_valid?({:rows => 1, :cols => 1})).to be true
    expect(table.is_valid?({:rows => 4, :cols => 4})).to be true
    expect(table.is_valid?({:rows => 0, :cols => 4})).to be true
    expect(table.is_valid?({:rows => 0, :cols => 0})).to be true
  end

  it('should be false if the ordinates are upper bound') do
    #expect(table.is_valid?({:rows => 5, :cols => 1})).to be false
    #expect(table.is_valid?({:rows => 0, :cols => 5})).to be false
    #expect(table.is_valid?({:rows => 10, :cols => 14})).to be false
    expect(table.is_valid?({:rows => -1, :cols => -1})).to be false
  end

end