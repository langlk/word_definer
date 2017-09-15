#!/usr/bin/env ruby

module WordDefiner
  class Word
    @@words = {}

    attr_reader :term, :definitions

    def initialize(attributes)
      if attributes.has_key?(:term)
        @term = attributes[:term]
      else
        raise ArgumentError.new("Must provide :term attribute")
      end
      if attributes.has_key?(:definition)
        @definitions = [attributes[:definition]]
      else
        @definitions = []
      end
    end

    def add_definition(definition)
      @definitions.push(definition)
    end

    def save
      @@words[@term.downcase] = self
    end

    def self.all
      @@words.keys.sort
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
