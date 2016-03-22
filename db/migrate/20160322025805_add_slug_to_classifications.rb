class AddSlugToClassifications < ActiveRecord::Migration
  def change
    add_column :classifications, :slug, :string
    add_index :classifications, :slug
    add_column :tags, :slug, :string
    add_index :tags, :slug
  end
end
