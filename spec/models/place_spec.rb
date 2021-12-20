require "rails_helper"

RSpec.describe Place, type: :model do
  describe "Direct Associations" do
    it { should have_many(:visits) }

    it { should have_many(:pins) }

    it { should have_many(:notes) }

    it { should have_many(:saved_places) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
