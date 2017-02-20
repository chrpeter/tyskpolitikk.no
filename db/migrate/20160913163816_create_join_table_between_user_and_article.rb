class CreateJoinTableBetweenUserAndArticle < ActiveRecord::Migration
  def change
    create_table :base_articles_users do |t|
      t.references :user, null: false, index: true
      t.references :base_article, null: false, index: true
    end
    add_foreign_key :base_articles_users, :users
    add_foreign_key :base_articles_users, :base_articles

  end
end
