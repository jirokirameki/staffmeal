class AddNameToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :brand_name, :string
    add_column :shops, :company_name, :string
    add_column :shops, :url, :string
    add_column :shops, :staff_name, :string
    add_column :shops, :tel, :string
  end
end
