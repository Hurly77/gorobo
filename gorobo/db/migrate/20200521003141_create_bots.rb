class CreateBots < ActiveRecord::Migration
  def change
    create_table :bots do |t|
      t.string :name
      t.string :group
      t.string :tasks
      t.string :skill_level
      t.integer :cost 
      t.string :instructions
      t.integer :builder_id
      t.timestamps null: false
    end
  end
end
