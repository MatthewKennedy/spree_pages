class CreateSpreePages < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_pages do |t|
      t.column :title, :string
      t.column :content, :text
      t.column :meta_title, :string
      t.column :meta_description, :text
      t.column :slug, :string, unique: true
      t.column :visible, :boolean, default: false

      t.timestamps
    end
  end
end
