class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.date :date
      t.string :description
      t.string :score
      t.integer :child_id

      t.timestamps null: false
    end
  end
end
