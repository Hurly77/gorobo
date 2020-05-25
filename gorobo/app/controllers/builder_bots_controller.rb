class BuilderBotsController < ApplicationController

  # GET: /builder_bots
  get "/builder_bots" do
    erb :"/builder_bots/index.html"
  end

  # GET: /builder_bots/new
  get "/builder_bots/new" do
    erb :"/builder_bots/new.html"
  end

  # POST: /builder_bots
  post "/builder_bots" do
    redirect "/builder_bots"
  end

  # GET: /builder_bots/5
  get "/builder_bots/:id" do
    erb :"/builder_bots/show.html"
  end

  # GET: /builder_bots/5/edit
  get "/builder_bots/:id/edit" do
    erb :"/builder_bots/edit.html"
  end

  # PATCH: /builder_bots/5
  patch "/builder_bots/:id" do
    redirect "/builder_bots/:id"
  end

  # DELETE: /builder_bots/5/delete
  delete "/builder_bots/:id/delete" do
    redirect "/builder_bots"
  end
end
