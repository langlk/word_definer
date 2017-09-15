require "sinatra"
require "sinatra/reloader"
also_reload 'lib/**/*.rb'
require "./lib/word"

get('/') do
  @word_list = WordDefiner::Word.all
  erb(:word_list)
end

post('/') do
  attributes = {}
  attributes[:term] = params["term"]
  if params["definition"].length > 0
    attributes[:definition] = params["definition"]
  end
  word = WordDefiner::Word.new(attributes)
  word.save
  @word_list = WordDefiner::Word.all
  erb(:word_list)
end

get('/word/:term') do
  @word = WordDefiner::Word.find(params[:term])
  erb(:word)
end

post('/word/:term') do
  @word = WordDefiner::Word.find(params[:term])
  if @word.class == WordDefiner::Word
    @word.add_definition(params["definition"])
  end
  erb(:word)
end
