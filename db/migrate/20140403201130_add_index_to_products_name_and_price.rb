class AddIndexToProductsNameAndPrice < ActiveRecord::Migration
  def change
  	add_index :products, :title, unique:true
  	add_index :products, :price
  end
end
