require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "no_peeping_jerrys"
  end
  
  get "/" do
    erb :index
  end
  
  helpers do
    def logged_in?
      !!session[:builder_id]
    end

    def current_builder
      Builder.find(session[:builder_id])
    end
  end
end
