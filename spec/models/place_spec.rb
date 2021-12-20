require 'rails_helper'

RSpec.describe Place, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:saved_places) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
