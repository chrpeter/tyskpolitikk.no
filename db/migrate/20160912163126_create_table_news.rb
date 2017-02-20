class CreateTableNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.binary :photo, limit: 10.megabytes
      t.string :title, null: false
      t.text :ingress
      t.text :text
      t.timestamps
    end
  end
end
