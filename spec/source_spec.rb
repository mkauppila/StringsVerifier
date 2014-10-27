require 'spec_helper'

describe StringsVerifier::Source do 

  it "should be able get the current character" do 
    source =  StringsVerifier::Source.new("hello")
    source.current_character.must_equal "h"
  end

  it "should be able to advance to next character" do 
    source =  StringsVerifier::Source.new("hello")
    source.current_character.must_equal "h"
    source.next
    source.current_character.must_equal "e"
  end

  it "should be able to peek at next character without moving to it" do 
    source =  StringsVerifier::Source.new("hello")
    source.current_character.must_equal "h"
    source.peek.must_equal "e"
    source.current_character.must_equal "h"
  end

  it "should return nil on end of file " do 
    source =  StringsVerifier::Source.new("h")
    source.current_character.must_equal "h"
    source.next
    source.current_character.must_equal nil
  end

  it "should return nil when peeking over the end of file" do
    source =  StringsVerifier::Source.new("h")
    source.current_character.must_equal "h"
    source.peek.must_equal nil
  end

end
