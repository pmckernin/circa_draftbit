require 'rails_helper'

RSpec.describe "visits#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/visits", params: params
  end

  describe 'basic fetch' do
    let!(:visit1) { create(:visit) }
    let!(:visit2) { create(:visit) }

    it 'works' do
      expect(VisitResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['visits'])
      expect(d.map(&:id)).to match_array([visit1.id, visit2.id])
    end
  end
end
