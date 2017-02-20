class CreateJoinTablesForArticeUsersAndNews < ActiveRecord::Migration
  def change
    create_table :articles_users do |t|
      t.references :user, null: false, index: true
      t.references :article, null: false, index: true
    end
    add_foreign_key :articles_users, :users
    add_foreign_key :articles_users, :articles

    create_table :news_users do |t|
      t.references :user, null: false, index: true
      t.references :news, null: false, index: true
    end
    add_foreign_key :news_users, :users
    add_foreign_key :news_users, :news
  end
end
