class CreateNoodles < ActiveRecord::Migration[6.0]
  def change
    create_table :noodles do |t|
      t.string  :store_name,        null: false
      t.integer :prefecture_id,     null: false
      t.integer :price,             null: false
      t.text    :description,       null: false
      t.text    :menu,              null: false
      t.text    :genre,             null: false
      t.integer :star_id,           null: false
      t.date    :eat_date
      t.references :user,           null: false,   foreign_key: true
      
      t.timestamps
    end
  end
end

