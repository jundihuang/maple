class AddSlugToSpecials < ActiveRecord::Migration
  def change
    add_column :specials, :slug, :string
    add_index :specials, :slug
  end
end
