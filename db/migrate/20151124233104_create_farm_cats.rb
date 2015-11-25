class CreateFarmCats < ActiveRecord::Migration
  def change
    create_table :farm_cats do |t|
      t.string :name
      t.text :description
      t.string :main_image
      t.integer :farm_cat_id
      t.string :slug
      t.string :has_farm_cats_type
      t.integer :has_farm_cats_id
      t.string :master_class

      t.timestamps null: false
    end
  end
end
