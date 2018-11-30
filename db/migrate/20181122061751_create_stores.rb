class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.references :company, foreign_key: true
      t.string :store
      t.string :address
      t.string :tel_num

      t.timestamps
    end
  end
end
