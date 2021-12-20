require "rails_helper"

RSpec.describe "visits#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/visits/#{visit.id}", payload
  end

  describe "basic update" do
    let!(:visit) { create(:visit) }

    let(:payload) do
      {
        data: {
          id: visit.id.to_s,
          type: "visits",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(VisitResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { visit.reload.attributes }
    end
  end
end
