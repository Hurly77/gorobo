class BuildersController < ApplicationController

  # GET: /builders
  get "/builders" do
    @builder = Builder.find_by(params[:builder_id])

    redirect to "/builders/#{@builder.id}"
  end

  # POST: /builders
  post "/builders" do
    redirect "/builders/:id"
  end

  # GET: /builders/new
  get "/builders/new" do
    erb :"/builders/new.html"
  end

  # GET: /builders/5
  get "/builders/:id" do
    @builder = Builder.find_by_id(params[:builder_id])

    erb :"/builders/show.html"
  end

  # GET: /builders/5/edit
  get "/builders/:id/edit" do
    @builder = Builder.find_by(params[:builder_id])


    erb :"/builders/edit.html"
  end

  # PATCH: /builders/5
  patch "/builders/:id" do
    @builder = Builder.find_by(params[:builder_id])
    @builder.name
    @builder.user_name
    @builder.email
    @builder.password
    @builder.save
    redirect "/builders/:id"
  end

  # DELETE: /builders/5/delete
  delete "/builders/:id/delete" do
    redirect "/builders"
  end
end
