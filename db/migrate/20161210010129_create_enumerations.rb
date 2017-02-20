class CreateEnumerations < ActiveRecord::Migration
  def change
    create_table :enumerations do |t|
      t.string :type, :null => false
      t.integer :ordinal, :null => false
      t.string :i18n_key

      t.timestamps
    end

    add_index :enumerations, [:type, :i18n_key], :unique => true
    add_index :enumerations, :i18n_key
  end
end
