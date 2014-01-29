require 'spec_helper'

describe StringsVerifier::Verifier do 
  before do
    @verifier = StringsVerifier::Verifier.new
  end

  describe "should recognize an empty line" do
    it "should recognize '' as empty line" do 
      @verifier.is_empty_line?('').must_be  :==, true
    end

    it "should recognize '  ' as empty line" do 
      @verifier.is_empty_line?('  ').must_be  :==, true
    end

    it "should recognize ' \n  ' as empty line" do 
      @verifier.is_empty_line?(" \n  ").must_be  :==, true
    end
  end

  describe "should recognize a line that starts a comment" do
    it "should recognize '/*' as comment " do
      @verifier.starts_comment?("/*").must_be :==, true
    end

    it "should recognize ' /* ' as comment " do
      @verifier.starts_comment?(" /* ").must_be :==, true
    end
  end
end
