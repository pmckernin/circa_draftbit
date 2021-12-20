require 'rails_helper'

RSpec.describe "visits#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/visits/#{visit.id}", params: params
  end

  describe 'basic fetch' do
    let!(:visit) { create(:visit) }

    it 'works' do
      expect(VisitResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('visits')
      expect(d.id).to eq(visit.id)
    end
  end
end
