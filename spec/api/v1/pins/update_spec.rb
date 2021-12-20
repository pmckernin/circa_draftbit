require 'rails_helper'

RSpec.describe "pins#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/pins/#{pin.id}", payload
  end

  describe 'basic update' do
    let!(:pin) { create(:pin) }

    let(:payload) do
      {
        data: {
          id: pin.id.to_s,
          type: 'pins',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(PinResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { pin.reload.attributes }
    end
  end
end
