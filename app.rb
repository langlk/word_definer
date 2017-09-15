#!/usr/bin/env ruby

require "sinatra"
require "sinatra/reloader"
also_reload 'lib/**/*.rb'
require "./lib/word"

get('/') do
  @word_list = WordDefiner::Word.all
  @search_term = params["search-term"]
  if @search_term
    search_result = WordDefiner::Word.find(@search_term)
    if search_result.class == String
      @search_result = search_result
    else
      @search_result = search_result.term.downcase
    end
  end
  erb(:word_list)
end

post('/') do
  attributes = {}
  @blank = params["term"].length == 0
  unless @blank
    attributes[:term] = params["term"]
    if params["definition"].length > 0
      attributes[:definition] = params["definition"]
    end
    word = WordDefiner::Word.new(attributes)
    word.save
  end
  @word_list = WordDefiner::Word.all
  erb(:word_list)
end

get('/word/:term') do
  @word = WordDefiner::Word.find(params[:term])
  erb(:word)
end

post('/word/:term') do
  @word = WordDefiner::Word.find(params[:term])
  @blank = params["definition"].length == 0
  if !@blank & (@word.class == WordDefiner::Word)
    @word.add_definition(params["definition"])
  end
  erb(:word)
end

get("/clear_all") do
  erb(:clear_all)
end

post("/clear_all") do
  WordDefiner::Word.clear_all
  redirect '/'
end
