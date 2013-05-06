require 'spec_helper'

describe Entry do
  before(:each) do
    @entry = FactoryGirl.create(:entry)
  end
  it "should create a new instance of an entry given valid attributes" do
    @entry.should be_persisted
  end
  
end
