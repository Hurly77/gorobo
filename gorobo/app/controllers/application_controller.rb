require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "no_peeping_jerrys"
  end

  get '/signup' do
    if !logged_in?

      erb :'/builders/new.html'
     else
      redirect to '/builders'
    end
  end

  post '/signup' do
    @builder = Builder.new(name: params[:name], user_name: params[:user_name], password: params[:password], email: params[:email]) #need more info on password_confirmation
    if @builder.save
      session[:builder_id] = @builder.id

      redirect to "/builders/#{@builder.id}"
    else 
      redirect to '/'
    end
    
  end

  get '/login' do
    if !logged_in?

      erb:'builders/index.html'
     else
      redirect to'/builders'
    end
  end

  post '/login' do
    @builder = Builder.find_by(user_name: params[:user_name])
    if @builder && @builder.authenticate(params[:password])
      session[:builder_id] = @builder.id

      redirect to "/builders/#{@builder.id}"
     else
      redirect to '/'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/'
    end
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

    def except!(keys)
      keys.each { |key| delete(key) }
      self
    end

  end
end
