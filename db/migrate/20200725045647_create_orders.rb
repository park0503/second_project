class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.integer :amount
      t.string :address1
      t.string :address2
      t.string :phone
      t.string :zipcode
      t.string :name
      t.datetime :completed_at

      t.timestamps
    end
  end
end
