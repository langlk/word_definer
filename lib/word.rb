#!/usr/bin/env ruby
require 'pry'

module WordDefiner
  class Word
    @@words = {}

    attr_reader :term, :definitions

    def initialize(term)
      @term = term
      @definitions = []
    end

    def add_definition(definition)
      @definitions.push(definition)
    end

    def save
      @@words[@term.downcase] = self
    end

    def self.all
      @@words.keys
    end

    def self.clear_all
      @@words = {}
    end

    def self.find(term)
      if @@words.has_key?(term.downcase)
        return @@words[term.downcase]
      else
        return "Word not found"
      end
    end
  end
end
