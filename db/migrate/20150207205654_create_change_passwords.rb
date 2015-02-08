class CreateChangePasswords < ActiveRecord::Migration
  def change
    create_table :change_passwords do |t|

      t.timestamps null: false
    end
  end
end
