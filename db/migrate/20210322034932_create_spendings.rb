class CreateSpendings < ActiveRecord::Migration[6.0]
  def change
    create_table :spendings do |t|

      t.integer :price, null: false
      t.string :category, null: false
      t.date :date, null: false
      t.string :memo, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
