require 'spec_helper'

describe Entry do
  before do
    @entry = FactoryGirl.create :entry
  end
  it "should validate_presence_of :kennzahl" do
    @entry.kennzahl = nil
    expect(@entry.valid?).to eql false
  end
  it "raises an error if kennzahl has the wrong format" do
    @entry.kennzahl = "1234"
    expect(@entry.valid?).to eql false
  end
end
