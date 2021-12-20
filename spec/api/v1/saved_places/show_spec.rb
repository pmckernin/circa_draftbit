require 'rails_helper'

RSpec.describe "saved_places#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/saved_places/#{saved_place.id}", params: params
  end

  describe 'basic fetch' do
    let!(:saved_place) { create(:saved_place) }

    it 'works' do
      expect(SavedPlaceResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('saved_places')
      expect(d.id).to eq(saved_place.id)
    end
  end
end
