class Necklace < ApplicationRecord
  mount_base64_uploader :image, ImageUploader

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
