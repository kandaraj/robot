require 'spec_helper'

describe Table do
  
  let(:table) { Table.new(5,5) }

  it('should be true if the ordinates') do
  	expect(table.is_valid?({:x => 1, :y => 1})).to be true
    expect(table.is_valid?({:x => 4, :y => 4})).to be true
    expect(table.is_valid?({:x => 0, :y => 4})).to be true
    expect(table.is_valid?({:x => 0, :y => 0})).to be true
  end

  it('should be false if the ordinates are upper bound') do
    expect(table.is_valid?({:x => 5, :y => 1})).to be false
    expect(table.is_valid?({:x => 0, :y => 5})).to be false
    expect(table.is_valid?({:x => 10, :y => 14})).to be false
    expect(table.is_valid?({:x => -1, :y => -1})).to be false
  end

end