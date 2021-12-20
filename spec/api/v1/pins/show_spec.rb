require 'rails_helper'

RSpec.describe "pins#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/pins/#{pin.id}", params: params
  end

  describe 'basic fetch' do
    let!(:pin) { create(:pin) }

    it 'works' do
      expect(PinResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('pins')
      expect(d.id).to eq(pin.id)
    end
  end
end
