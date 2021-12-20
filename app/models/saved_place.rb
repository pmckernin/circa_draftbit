class SavedPlace < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    place.to_s
  end

end
