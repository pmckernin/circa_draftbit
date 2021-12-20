class PlaceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :city, :string

  # Direct associations

  has_many   :notes

  has_many   :saved_places

  # Indirect associations

end
