$:.push File.expand_path("../lib", __FILE__)
require "strings_verifier/version"

Gem::Specification.new do |s|
  s.name = 'strings-verifier'
  s.version = '0.0.1'
  s.date = '2014-01-22'
  s.summary = '.strings verifier'
  s.description = "Verifies Apple's .strings translation files"
  s.authors = ['Markus Kauppila']
  s.email = 'markus.kauppila@gmail.com'
  s.files = ['lib/strings_verifier.rb']
  s.executables << 'strings-verifier'
end
