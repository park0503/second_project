class AddNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :zipcode, :string
    add_column :users, :address1, :string
    add_column :users, :address2, :string
  end
end
