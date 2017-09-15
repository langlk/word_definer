#!/usr/bin/env ruby

require 'rspec'
require 'word'

describe('WordDefiner::Word') do
  before() do
    WordDefiner::Word.clear_all
  end

  it "stores a word inputted by a user" do
    palindrome = WordDefiner::Word.new({:term => "Palindrome"})
    expect(palindrome.term).to(eq("Palindrome"))
  end

  it "stores a word and definition inputted by a user" do
    anagrams = WordDefiner::Word.new({:term => "anagrams", :definition => "Two words with the same letters."})
  end

  describe('#add_definition') do
    it "lets user input multiple definitions for a word" do
      palindrome = WordDefiner::Word.new({:term => "Palindrome"})
      palindrome.add_definition("A word or phrase that says the same thing when reversed.")
      palindrome.add_definition("A word or phrase that equals its reverse.")
      expect(palindrome.definitions).to(eq(["A word or phrase that says the same thing when reversed.", "A word or phrase that equals its reverse."]))
    end
  end

  describe('#save') do
    it "saves a word object to the list of words" do
      anagram = WordDefiner::Word.new({:term => "Anagram"})
      anagram.save
      expect(WordDefiner::Word.all).to(eq(["anagram"]))
    end
  end

  describe('.all') do
    it "returns nothing if no words have been created" do
      expect(WordDefiner::Word.all).to(eq([]))
    end

    it "returns an array of all terms saved in words" do
      anagram = WordDefiner::Word.new({:term => "Anagram"})
      anagram.save
      palindrome = WordDefiner::Word.new({:term => "Palindrome"})
      palindrome.save
      expect(WordDefiner::Word.all).to(eq(["anagram", "palindrome"]))
    end
  end

  describe('.clear_all') do
    it "removes all words from the words list" do
      anagram = WordDefiner::Word.new({:term => "Anagram"})
      anagram.save
      WordDefiner::Word.clear_all
      expect(WordDefiner::Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it "finds a word by its term" do
      anagram = WordDefiner::Word.new({:term => "anagram"})
      anagram.save
      palindrome = WordDefiner::Word.new({:term => "palindrome"})
      palindrome.save
      expect(WordDefiner::Word.find("anagram")).to(eq(anagram))
    end

    it "ignores case when finding a word" do
      anagram = WordDefiner::Word.new({:term => "anagram"})
      anagram.save
      palindrome = WordDefiner::Word.new({:term => "palindrome"})
      palindrome.save
      expect(WordDefiner::Word.find("ANAGRAM")).to(eq(anagram))
    end

    it "returns 'Word not found' if word is not saved in list" do
      expect(WordDefiner::Word.find("potato")).to(eq("Word not found"))
    end
  end
end
