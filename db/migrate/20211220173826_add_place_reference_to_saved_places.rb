class AddPlaceReferenceToSavedPlaces < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :saved_places, :places
    add_index :saved_places, :place_id
    change_column_null :saved_places, :place_id, false
  end
end
