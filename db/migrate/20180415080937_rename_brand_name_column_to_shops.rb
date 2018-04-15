class RenameBrandNameColumnToShops < ActiveRecord::Migration[5.0]
  def change
    rename_column :shops, :brand_name, :shop_name
  end
end
