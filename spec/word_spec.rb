#!/usr/bin/env ruby

require 'rspec'
require 'word'

describe('WordDefiner::Word') do
  it "stores a word inputted by a user" do
    palindrome = WordDefiner::Word.new("Palindrome")
    expect(palindrome.term).to(eq("Palindrome"))
  end
end
