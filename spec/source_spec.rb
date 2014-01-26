require 'spec_helper'

describe StringsVerifier::Source do 
  before do
    contents = "first\nsecond\nthird\n"
    @source = StringsVerifier::Source.new(contents)
  end

  it "should be created" do
    @source.must_be_kind_of StringsVerifier::Source
  end

  it "should have three lines" do
    @source.number_of_lines.must_equal 3
  end

  it "it should advance lines" do
    @source.get_line.must_match /first/
    @source.get_line.must_match /second/
    @source.get_line.must_match /third/
  end
end