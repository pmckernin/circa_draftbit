class AddPlaceReferenceToNotes < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :notes, :places
    add_index :notes, :place_id
    change_column_null :notes, :place_id, false
  end
end
