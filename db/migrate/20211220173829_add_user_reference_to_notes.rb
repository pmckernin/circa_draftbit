class AddUserReferenceToNotes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :notes, :users
    add_index :notes, :user_id
    change_column_null :notes, :user_id, false
  end
end
