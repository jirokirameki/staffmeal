class RemoveAddressToShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :address, :string
  end
end
