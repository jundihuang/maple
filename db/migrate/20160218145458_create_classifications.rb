class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
