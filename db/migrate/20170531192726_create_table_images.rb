class CreateTableImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :caption, default: ''
      t.string :image_file, null: false
      t.timestamps
    end
  end
end
