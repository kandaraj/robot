require 'spec_helper'

describe Table do
  
  before :each do
  	@table = Table.new
  end	

  it('should be init with the size') do
  	expect(true).to be_true	
  end

  it('should place toy in place') do
  	expect(@table.place(0,0,:north)).to be true
  	expect(@table.place(0,3,:south)).to be true
  	expect(@table.place(3,3,:west)).to be true
  	expect(@table.place(3,4,:east)).to be true
  end



end