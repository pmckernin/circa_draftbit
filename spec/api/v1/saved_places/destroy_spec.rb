require "rails_helper"

RSpec.describe "saved_places#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/saved_places/#{saved_place.id}"
  end

  describe "basic destroy" do
    let!(:saved_place) { create(:saved_place) }

    it "updates the resource" do
      expect(SavedPlaceResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { SavedPlace.count }.by(-1)
      expect { saved_place.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
