class CreateRecruits < ActiveRecord::Migration[5.0]
  def change
    create_table :recruits do |t|
      t.references :company, foreign_key: true
      t.date :startdate
      t.date :enddate
      t.string :agent
      t.integer :cost
      t.string :area
      t.integer :application_num
      t.integer :interview_num
      t.integer :employ_num
      t.text :memo

      t.timestamps
    end
  end
end
