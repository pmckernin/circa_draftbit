require "rails_helper"

RSpec.describe Pin, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:place) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
