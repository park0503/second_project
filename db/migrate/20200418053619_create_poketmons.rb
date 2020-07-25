class CreatePoketmons < ActiveRecord::Migration[6.0]
  def change
    create_table :poketmons do |t|
      t.string :name
      t.integer :hp

      t.timestamps
    end
  end
end
