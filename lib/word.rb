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
  end
end
