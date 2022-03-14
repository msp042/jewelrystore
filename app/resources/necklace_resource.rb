class NecklaceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :category_id, :integer
  attribute :title, :string
  attribute :price, :float
  attribute :image, :string

  # Direct associations

  belongs_to :category

  has_many   :bookmarks

  # Indirect associations
end
