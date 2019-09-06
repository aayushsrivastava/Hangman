require "sinatra"
require "sinatra/reloader" if development?
require "./game"

enable :sessions

game = Game.new

get "/" do
  game.load(session[:state])
  erb :form, { :locals => { :game_progress => game.show } }
end

post "/" do
  game.play(params[:guess])
  session[:state] = game.state
  redirect "/"
end

get "/new" do
  session.delete(:state)
  game.load
  redirect "/"
end

get "/help" do
  erb :help
end
