class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :floor
      t.string :phone_number
      t.text :about
      t.string :avatar

      t.timestamps
    end
  end
end
