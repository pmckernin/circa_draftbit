class SavedPlaceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :place_id, :integer
  attribute :user_id, :integer

  # Direct associations

  # Indirect associations

end
