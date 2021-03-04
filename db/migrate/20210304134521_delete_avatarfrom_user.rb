class DeleteAvatarfromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :avatar
  end
end
