require "rails_helper"

RSpec.describe "saved_places#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/saved_places", params: params
  end

  describe "basic fetch" do
    let!(:saved_place1) { create(:saved_place) }
    let!(:saved_place2) { create(:saved_place) }

    it "works" do
      expect(SavedPlaceResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["saved_places"])
      expect(d.map(&:id)).to match_array([saved_place1.id, saved_place2.id])
    end
  end
end
