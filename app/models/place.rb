class Place < ApplicationRecord
  # Direct associations

  has_many   :notes,
             :dependent => :destroy

  has_many   :saved_places,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
