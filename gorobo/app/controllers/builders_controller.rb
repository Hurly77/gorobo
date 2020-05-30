class BuildersController < ApplicationController

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

      flash[:success] = "Welcome #{@builder.user_name} to the World of GoRobo!!"
      redirect to "/builders/#{@builder.id}"
    else 
      flash[:message] = "NO FIELDS CAN BE BLANK"
      redirect to '/signup'
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

      flash[:success] = "welcome back #{@builder.name}"
      redirect to "/builders/#{@builder.id}"
     else
      flash[:message] = "Password or builder name is invalid"
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to '/'
    end
  end

  get "/builders" do
    @builder = current_builder

    redirect to "/builders/#{@builder.id}"
  end

  # GET: /builders/5
  get "/builders/:id" do
    @builder = current_builder

    erb :"/builders/show.html"
  end

  # GET: /builders/5/edit
  get "/builders/:id/edit" do
    @builder = current_builder


    erb :"/builders/edit.html"
  end

  # PATCH: /builders/5
  patch "/builders/:id" do
    @builder = Builder.find(params[:id])
   if  @builder.save
    flash[:message] = "yep"
    redirect "/builders/#{@builder.id}"
   else 
    flash[:message] = "nope"
    redirect "/builders/#{@builder.id}"
  end
end

  # DELETE: /builders/5/delete
  delete "/builders/:id/delete" do
      flash[:success] = "CONGRATS you just deleted your builder"
    if current_builder
      current_builder.destroy
    session.clear
    flash[:success] = "CONGRATS you just deleted your builder"
    redirect "/"
    else 
      redirect to "/builders/#{current_builder.id}"
      flash[:message] = "this is not your account"
    end
  end
end
