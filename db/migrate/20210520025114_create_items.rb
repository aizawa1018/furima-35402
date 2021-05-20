class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,       foreign_key: true 
      t.integer :category_id,   null: false
      t.integer :fare_id,       null: false
      t.integer :condition_id,  null: false
      t.integer :days_id,       null: false
      t.integer :prefecture_id, null: false
      t.string :title,          null: false
      t.string :description,    null: false
      t.integer :pride,         null: false

      t.timestamps
    end
  end
end
