require 'rails_helper'

RSpec.describe "saved_places#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/saved_places", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'saved_places',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SavedPlaceResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { SavedPlace.count }.by(1)
    end
  end
end
