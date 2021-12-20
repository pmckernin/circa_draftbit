class AddLocationReferenceToVisits < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :visits, :places, column: :location_id
    add_index :visits, :location_id
    change_column_null :visits, :location_id, false
  end
end
