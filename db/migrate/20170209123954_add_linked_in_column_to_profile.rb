class AddLinkedInColumnToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :linkedin, :string 
  end
end
