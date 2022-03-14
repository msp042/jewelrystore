class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :necklace

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    necklace.to_s
  end

end
