require 'spec_helper'

describe "Verifier should verify different elements" do
  let(:verifier) { StringsVerifier::Verifier.new }

  it "should properly verify a correct one line comment" do
    str = "/* this is a comment */"
    source = StringsVerifier::Source.new(str)

    errors = verifier.verify_comment(source)
    errors.must_be_empty
  end

  it "should properly verify correct multiline correct" do
    str = "/* this \nis a\ncomment\n"
    source = StringsVerifier::Source.new(str)

    errors = verifier.verify_comment(source)
    errors.must_be_empty
  end

  it "should detect incorrect single line comment" do
    str = "/ this is a broken comment"
    source = StringsVerifier::Source.new(str)

    errors = verifier.verify_comment(source)
    errors.wont_be_empty
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
