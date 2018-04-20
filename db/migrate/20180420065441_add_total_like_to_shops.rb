class AddTotalLikeToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :total_like, :integer, default: 0
  end
end
