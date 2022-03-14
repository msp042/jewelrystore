require "rails_helper"

RSpec.describe Necklace, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:category) }

    it { should have_many(:bookmarks) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
