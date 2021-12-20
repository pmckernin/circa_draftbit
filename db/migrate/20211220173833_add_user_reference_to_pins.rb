class AddUserReferenceToPins < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :pins, :users
    add_index :pins, :user_id
    change_column_null :pins, :user_id, false
  end
end
