class Necklace < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category.to_s
  end

end
