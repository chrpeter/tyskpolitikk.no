class CreateTableBaseArticle < ActiveRecord::Migration
  def change
    create_table :base_articles do |t|
      t.string :object_type, null:  false
      t.string :title, null: false
      t.binary :header_photo, limit: 10.megabytes
      t.text :ingress
      t.text :content
      t.integer :owner_id, references:  'users'
      t.boolean :public
      t.timestamps
    end
    add_index :base_articles, :owner_id
  end
end
