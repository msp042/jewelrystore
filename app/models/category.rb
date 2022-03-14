class Category < ApplicationRecord
  # Direct associations

  has_many   :necklaces,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end
end
