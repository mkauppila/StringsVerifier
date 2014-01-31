require 'spec_helper'

describe "Verifier should verify correctness"
  before do
    @verifier = StringsVerifier::Verifier.new
  end

  it "should verify that given comment is correct"
    str = "/* this is a comment */"
    @verifier.verify_comment(str, source)
  end
end

describe "Verifier should recognize different types of data" do 
  let(:verifier) { StringsVerifier::Verifier.new } 

  it "should recognize '' as empty line" do 
    verifier.is_empty_line?('').must_be  :==, true
  end

  it "should recognize '  ' as empty line" do 
    verifier.is_empty_line?('  ').must_be  :==, true
  end

  it "should recognize ' \n  ' as empty line" do 
    verifier.is_empty_line?(" \n  ").must_be  :==, true
  end

  it "should recognize '/*' as comment " do
    verifier.starts_comment?("/*").must_be :==, true
  end

  it "should recognize ' /* ' as comment " do
    verifier.starts_comment?(" /* ").must_be :==, true
  end

  it "should recognize '\"' as localizable string"  do 
    verifier.is_localizable_string?('"').must_be :==, true
  end

  it "should recognize ' \" ' as localizable string"  do 
    verifier.is_localizable_string?(' " ').must_be :==, true
  end
end
