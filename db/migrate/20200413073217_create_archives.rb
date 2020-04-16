class CreateArchives < ActiveRecord::Migration[6.0]
  def change
    create_table :archives do |t|
      t.string :name
      t.string :brand
      t.text :image
      t.float :price
      t.string :place
      t.date :purchase_date

      t.timestamps
    end
  end
end
