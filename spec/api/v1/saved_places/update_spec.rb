require 'rails_helper'

RSpec.describe "saved_places#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/saved_places/#{saved_place.id}", payload
  end

  describe 'basic update' do
    let!(:saved_place) { create(:saved_place) }

    let(:payload) do
      {
        data: {
          id: saved_place.id.to_s,
          type: 'saved_places',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(SavedPlaceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { saved_place.reload.attributes }
    end
  end
end
