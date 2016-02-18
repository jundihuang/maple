class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.datetime :create_time
      t.datetime :update_time
      t.references :special
      t.references :classification

      t.timestamps null: false
    end
  end
end
