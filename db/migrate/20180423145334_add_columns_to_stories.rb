class AddColumnsToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :draft, :boolean, default: false
    add_column :stories, :image, :string
    
    add_column :stories, :origin, :string
    add_column :stories, :recommend, :string
    add_column :stories, :atmosphere, :string
  end
end
