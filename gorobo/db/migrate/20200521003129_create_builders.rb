class CreateBuilders < ActiveRecord::Migration
  def change
    create_table :builders do |t|
      t.string :name
      t.string :user_name
      t.string :password_digest
      t.string :email
      t.timestamps null: false
    end
  end
end
