class ChangeColumnTypeToString < ActiveRecord::Migration
  def change
    change_column :profiles, :avatar, :string
    change_column :base_articles, :header_photo, :string

  end
end
