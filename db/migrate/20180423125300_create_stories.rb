class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end