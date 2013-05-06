require 'spec_helper'

describe User do
  before(:each) do
    @editor = FactoryGirl.create(:editor)
  end
  it "should create a new instance of a user given valid attributes" do
    @editor.should be_persisted
    @editor.role.should == "editor"
  end
end
