require 'spec_helper'

describe StringsVerifier::Source do 
  let(:source) do
    contents = "first\nsecond\nthird\n"
    StringsVerifier::Source.new(contents)
  end

  it "should be created" do
    source.must_be_kind_of StringsVerifier::Source
  end

  it "should have three lines" do
    source.number_of_lines.must_equal 3
  end

  it "should return the current line" do
    source.get_current_line.must_match /first/
  end

  it "should be able to advance the line" do
    source.get_current_line.must_match /first/
    source.advance_to_next_line
    source.get_current_line.must_match /second/
  end
end