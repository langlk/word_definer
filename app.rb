require "sinatra"
require "sinatra/reloader"
also_reload 'lib/**/*.rb'
require "./lib/word"

get('/') do
  @word_list = ["This", "is", "a", "test"]
  erb(:word_list)
end
