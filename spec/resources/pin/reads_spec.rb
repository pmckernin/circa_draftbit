require "rails_helper"

RSpec.describe PinResource, type: :resource do
  describe "serialization" do
    let!(:pin) { create(:pin) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(pin.id)
      expect(data.jsonapi_type).to eq("pins")
    end
  end

  describe "filtering" do
    let!(:pin1) { create(:pin) }
    let!(:pin2) { create(:pin) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: pin2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([pin2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:pin1) { create(:pin) }
      let!(:pin2) { create(:pin) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      pin1.id,
                                      pin2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      pin2.id,
                                      pin1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
