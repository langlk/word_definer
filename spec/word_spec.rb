#!/usr/bin/env ruby

require 'rspec'
require 'word'

describe('WordDefiner::Word') do
  it "stores a word inputted by a user" do
    palindrome = WordDefiner::Word.new("Palindrome")
    expect(palindrome.term).to(eq("Palindrome"))
  end

  describe('#add_definition') do
    it "lets user input multiple definitions for a word" do
      palindrome = WordDefiner::Word.new("Palindrome")
      palindrome.add_definition("A word or phrase that says the same thing when reversed.")
      palindrome.add_definition("A word or phrase that equals its reverse.")
      expect(palindrome.definitions).to(eq(["A word or phrase that says the same thing when reversed.", "A word or phrase that equals its reverse."]))
    end
  end
end
