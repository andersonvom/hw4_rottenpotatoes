require 'spec_helper'

describe MoviesHelper do

  describe "#oddness" do
    it "should distinguish between odd or even" do
      helper.oddness(2).should == "even"
      helper.oddness(1).should == "odd"
    end
  end

end
