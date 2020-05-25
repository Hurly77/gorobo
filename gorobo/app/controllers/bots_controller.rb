class BotsController < ApplicationController

  # GET: /bots
  get "/bots" do
    @bots = Bot.all
    erb :"/bots/index.html"
  end

  # GET: /bots/new
  get "/bots/new" do
    erb :"/bots/new.html"
  end

  # POST: /bots
  post "/bots" do
    params.delete_if {|p| p == "submit"}
    @bots = Bot.create(:name => params[:name], :group => params[:group], :tasks => params[:tasks], :skill_level => params[:skill_level], :cost => params[:cost], :instructions => params[:instructions])
    redirect to "/bots"
  end

  # GET: /bots/5
  get "/bots/:id" do
    erb :"/bots/show.html"
  end

  # GET: /bots/5/edit
  get "/bots/:id/edit" do
    erb :"/bots/edit.html"
  end

  # PATCH: /bots/5
  patch "/bots/:id" do
    redirect "/bots/:id"
  end

  # DELETE: /bots/5/delete
  delete "/bots/:id/delete" do
    redirect "/bots"
  end

end
