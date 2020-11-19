class CreatePagesStores < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_pages_stores, id: false do |t|
      t.belongs_to :store
      t.belongs_to :page
    end
  end
end
