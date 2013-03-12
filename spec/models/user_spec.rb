require 'spec_helper'

describe User do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end
  it "should create a new instance of a user given valid attributes" do
    @user.should be_persisted
    @user.role.should == "user"
  end
end
