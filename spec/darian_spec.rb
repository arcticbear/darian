# encoding: utf-8
require File.expand_path('../spec_helper', __FILE__)

describe Darian do

  it "should return own version" do
    Darian::VERSION.should be_a(String)
  end

  it "should convert by argument class" do
    Darian.from_earth(Time.now).should     be_a(Darian::Time)
    Darian.from_earth(DateTime.now).should be_a(Darian::Time)
    Darian.from_earth(Date.today).should   be_a(Darian::Date)
    lambda { Darian.from_earth(1) }.should raise_error(ArgumentError)
  end

  it "should return current time" do
    earth = Time.parse('2012-05-16 10:00:00 UTC')
    Time.should_receive(:now).and_return(earth)

    Darian.now.to_s.should == '214-09-17 15:07:17'
  end

  it "should return current date" do
    earth = Time.parse('2012-05-16 10:00:00 UTC')
    Time.should_receive(:now).and_return(earth)

    Darian.today.to_s.should == '214-17-05'
  end

end
