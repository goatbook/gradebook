class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
