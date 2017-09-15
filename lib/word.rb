#!/usr/bin/env ruby
require 'pry'

module WordDefiner
  class Word
    attr_reader :term

    def initialize(term)
      @term = term
    end
  end
end
