class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :code
      t.integer :stock, default: 0
      t.decimal :price, precision: 10, scale: 2, default: 0

      t.timestamps
    end
  end
end
