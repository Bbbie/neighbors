class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :board
      t.string :category
      t.string :title
      t.text :description
      t.string :start_date
      t.string :start_time
      t.string :end_date
      t.string :end_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
