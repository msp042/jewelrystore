require "rails_helper"

RSpec.describe Bookmark, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:user) }

    it { should belong_to(:necklace) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
