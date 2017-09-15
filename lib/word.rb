#!/usr/bin/env ruby
require 'pry'

module WordDefiner
  class Word
    attr_reader :term, :definitions

    def initialize(term)
      @term = term
      @definitions = []
    end

    def add_definition(definition)
      @definitions.push(definition)
    end
  end
end
