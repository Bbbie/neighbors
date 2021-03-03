class AddLogoutToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :last_logout, :datetime
  end
end
