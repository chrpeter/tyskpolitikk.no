class CreateTableProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, null: false, index: true
      t.binary :avatar, limit: 10.megabytes
      t.string :name, null: false
      t.string :email, limit: 50
      t.string :phone, limit: 20
      t.string :twitter
      t.string :facebook
      t.string :instagram
      t.string :snapchat
      t.string :location
      t.string :locale, default: 'nb'
      t.text :description
      t.date :date_of_birth
      t.timestamps
    end
    add_foreign_key :profiles, :users
  end
end
