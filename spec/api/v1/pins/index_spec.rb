require 'rails_helper'

RSpec.describe "pins#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/pins", params: params
  end

  describe 'basic fetch' do
    let!(:pin1) { create(:pin) }
    let!(:pin2) { create(:pin) }

    it 'works' do
      expect(PinResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['pins'])
      expect(d.map(&:id)).to match_array([pin1.id, pin2.id])
    end
  end
end
