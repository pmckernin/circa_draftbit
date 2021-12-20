class AddUserReferenceToVisits < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :visits, :users
    add_index :visits, :user_id
    change_column_null :visits, :user_id, false
  end
end
