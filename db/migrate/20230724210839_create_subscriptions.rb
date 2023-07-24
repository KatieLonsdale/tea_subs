class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :title
      t.string :price
      t.integer :status, default: 1
      t.string :frequency

      t.timestamps
    end
  end
end
