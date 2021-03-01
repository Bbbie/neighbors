class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_reference :users, :community, null: false, foreign_key: true
    add_reference :users, :profile, null: false, foreign_key: true
  end
end
