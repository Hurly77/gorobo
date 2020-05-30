class BotsController < ApplicationController

  # GET: /bots
  get "/bots" do
  @bots = current_builder.bots.all
    erb :"/bots/index.html"
  end

  # GET: /bots/new
  get "/bots/new" do
    erb :"/bots/new.html"
  end

  # POST: /bots
  post "/bots" do
    params.delete_if {|p| p == "submit"}
    if !Bot.find_by(name: params[:name])
      @bot = Bot.new(params)
      @bot.save
      current_builder.bots << @bot
      current_builder.save

      flash[:success] = "It's Alive!!!"
      redirect to "/bots/#{@bot.id}"
     else
      flash[:message] = "you already made that bot"
      redirect to "/bots"
    end
    
  end

  # GET: /bots/5
  get "/bots/:id" do
    if current_builder
    @bot = Bot.find(params[:id])
    erb :"/bots/show.html"
    
  else 
    redirect "/"
    end
  end

  # GET: /bots/5/edit
  get "/bots/:id/edit" do
    @bot = Bot.find_by(params)
    erb :"/bots/edit.html"
  end

  # PATCH: /bots/5
  patch "/bots/:id" do
    
    @bot = Bot.find(params[:id])
    if current_builder.bot_ids.include?(@bot.id)
      @bot.name = params[:name]
      @bot.group = params[:group]
      @bot.tasks = params[:tasks]
      @bot.skill_level = params[:skill_level]
      @bot.cost = params[:cost]
      @bot.instructions = params[:instructions]
      @bot.save
      redirect to "/bots"
    else
      flash[:message] ="that is not yo bot baby"
      redirect to "/"
    end
  end

  delete "/bots/:id/delete" do
    @bot = Bot.find(params[:id])
    if current_builder.bot_ids.include?(@bot.id)
      @bot.destroy

    redirect "/builders/#{current_builder.id}"
    else
      flash[:message] = "FAILD!"

      redirect "/builders/#{current_builder.id}"
    end
  end

end
