require 'spec_helper'

describe Comment do
  before(:each) do
    @comment = FactoryGirl.create(:comment)
  end
  it "should create a new instance of an entry given valid attributes" do
    @comment.should be_persisted
    @comment.user.should_not be_nil
    @comment.entry.should_not be_nil
  end
end
