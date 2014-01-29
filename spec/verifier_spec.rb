require 'spec_helper'

describe StringsVerifier::Verifier do 
  before do
    @verifier = StringsVerifier::Verifier.new
  end

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
