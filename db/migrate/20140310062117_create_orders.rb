class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.integer :phone_number
      t.string :pay_type
      t.timestamps
    end

    add_index :orders, :email
  end
end
