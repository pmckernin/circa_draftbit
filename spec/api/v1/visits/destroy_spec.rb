require 'rails_helper'

RSpec.describe "visits#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/visits/#{visit.id}"
  end

  describe 'basic destroy' do
    let!(:visit) { create(:visit) }

    it 'updates the resource' do
      expect(VisitResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Visit.count }.by(-1)
      expect { visit.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
