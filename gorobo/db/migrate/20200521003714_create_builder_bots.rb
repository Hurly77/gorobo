class CreateBuilderBots < ActiveRecord::Migration
  def change
    create_table :builder_bots do |t|
      t.integer :builder_id
      t.integer :bot_id
      t.timestamps null: false
    end
  end
end
