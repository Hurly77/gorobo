require_relative "../app/models/builder.rb"
Builder.create(:name => "Melissa", :user_name => "dev1", :email => "Melissa@email.com", :password => "1234")
Builder.create(:name => "April", :user_name => "dev2", :email => "April@email.com", :password => "12345")
Builder.create(:name => "Luke", :user_name => "dev3", :email => "Luke@email.com", :password => "123456")
Builder.create(:name => "Devon", :user_name => "dev4", :email => "Devon@email.com", :password => "1234567")
Builder.create(:name => "Sarah", :user_name => "dev5", :email => "Sarah@email.com", :password => "12345678")

Bot.create(:name => "bot1", :group => "domestic", :tasks => "guards home", :skill_level => "novice", :cost => 100, :instructions => "lorem ipsum", :builder_id => 1)  
Bot.create(:name => "bot3", :group => "toy", :tasks => "multi tool remote bot", :skill_level => "beginer", :cost => 200, :instructions => "lorem ipsum", :builder_id => 3)  
Bot.create(:name => "bot3", :group => "Labor", :tasks => "crane", :skill_level => "newbie", :cost => 300, :instructions => "lorem ipsum", :builder_id => 4)  
Bot.create(:name => "bot4", :group => "business", :tasks => "ai, drone", :skill_level => "expert", :cost => 400, :instructions => "lorem ipsum", :builder_id => 5)  
Bot.create(:name => "bot5", :group => "Friend", :tasks => "companion", :skill_level => "veteran", :cost => 500, :instructions => "lorem ipsum", :builder_id => 3)  
