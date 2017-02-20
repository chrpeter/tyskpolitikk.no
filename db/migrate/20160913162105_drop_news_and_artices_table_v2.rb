class DropNewsAndArticesTableV2 < ActiveRecord::Migration
  def change
    drop_table :news
    drop_table :articles
  end
end
