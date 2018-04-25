class AddNameToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :shop_name, :string
    add_column :shops, :url, :string
    add_column :shops, :image, :string
    add_column :shops, :phone_number, :string
    add_column :shops, :total_like, :integer, default: 0
    add_column :shops, :total_follower, :integer, default: 0
    add_column :shops, :shop_type, :string
    add_column :shops, :near_station, :string
    add_column :shops, :open_hours_lunch, :string
    add_column :shops, :open_hours_dinner, :string    
    add_column :shops, :closed_days, :string
    add_column :shops, :price_range_lunch, :string
    add_column :shops, :price_range_dinner, :string
    add_column :shops, :other, :string
    
    add_column :shops, :latitude, :float
    add_column :shops, :longitude, :float
    add_column :shops, :post_code, :string
    add_column :shops, :prefecture, :string
    add_column :shops, :city, :string
    add_column :shops, :street, :string
    add_column :shops, :building, :string
    add_column :shops, :address, :string
  end
end
