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
