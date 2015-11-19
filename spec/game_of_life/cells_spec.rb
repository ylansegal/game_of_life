require "spec_helper"

module GameOfLife
  describe LiveCell do
    it "has a string representation" do
      subject.to_s.should == "*"
    end
  end

  describe DeadCell do
    it "has a string representation" do
      subject.to_s.should == " "
    end
  end
end
