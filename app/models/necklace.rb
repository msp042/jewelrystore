class Necklace < ApplicationRecord
  # Direct associations

  belongs_to :category

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category.to_s
  end

end
