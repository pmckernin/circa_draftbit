class Place < ApplicationRecord
  # Direct associations

  has_many   :visits,
             :foreign_key => "location_id",
             :dependent => :destroy

  has_many   :pins,
             :dependent => :destroy

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
