class AddPlaceReferenceToPins < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :pins, :places
    add_index :pins, :place_id
    change_column_null :pins, :place_id, false
  end
end
