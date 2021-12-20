require 'rails_helper'

RSpec.describe "pins#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/pins/#{pin.id}"
  end

  describe 'basic destroy' do
    let!(:pin) { create(:pin) }

    it 'updates the resource' do
      expect(PinResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Pin.count }.by(-1)
      expect { pin.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
