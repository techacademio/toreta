class CreateStoreRecruits < ActiveRecord::Migration[5.0]
  def change
    create_table :store_recruits do |t|
      t.references :store, foreign_key: true
      t.references :recruit, foreign_key: true

      t.timestamps
      
      t.index [:store_id, :recruit_id], unique: true
    end
  end
end
