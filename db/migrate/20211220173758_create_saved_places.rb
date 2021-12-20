class CreateSavedPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_places do |t|
      t.integer :place_id
      t.integer :user_id

      t.timestamps
    end
  end
end
