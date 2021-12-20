class AddUserReferenceToSavedPlaces < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :saved_places, :users
    add_index :saved_places, :user_id
    change_column_null :saved_places, :user_id, false
  end
end
