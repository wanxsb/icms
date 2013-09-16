class CreateProductsProducts < ActiveRecord::Migration

  def up
    create_table :refinery_products do |t|
      t.string :title
      t.decimal :price
      t.string :abstract
      t.text :description
      t.text :detail
      t.integer :photo_id
      t.boolean :showOnIndex
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-products"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/products/products"})
    end

    drop_table :refinery_products

  end

end
