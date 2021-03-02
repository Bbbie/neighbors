class AddPicturesToCard < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :pictures, :string
  end
end
