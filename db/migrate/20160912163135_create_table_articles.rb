class CreateTableArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.binary :photo, limit: 10.megabytes
      t.string :title, null: false
      t.text :ingress
      t.text :text
      t.timestamps
    end
  end
end
