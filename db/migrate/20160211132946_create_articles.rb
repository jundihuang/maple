class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      #t.references :special
      #t.references :classification
      t.belongs_to :special
      t.belongs_to :classification
      t.timestamps null: false
    end
  end
end
