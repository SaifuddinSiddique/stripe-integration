class AddSalesCountToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :sales_count, :integer, default: 0
  end
end
