class DropNewsAndArticesTable < ActiveRecord::Migration
  def change
    drop_table :news_users
    drop_table :articles_users
  end
end
