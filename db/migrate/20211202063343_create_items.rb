class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.text :introduction,          null: false
      t.integer :price,              null: false
      t.integer :category_id,        null: false
      t.integer :item_conditions_id, null: false
      t.integer :area_id,            null: false
      t.integer :postage_fee_id,     null: false
      t.integer :postege_day_id,     null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
