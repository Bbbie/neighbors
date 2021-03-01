class CreateCardRecipients < ActiveRecord::Migration[6.0]
  def change
    create_table :card_recipients do |t|
      t.references :user, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
