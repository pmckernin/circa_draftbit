require "rails_helper"

RSpec.describe PinResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "pins",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PinResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Pin.count }.by(1)
    end
  end

  describe "updating" do
    let!(:pin) { create(:pin) }

    let(:payload) do
      {
        data: {
          id: pin.id.to_s,
          type: "pins",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PinResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { pin.reload.updated_at }
      # .and change { pin.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:pin) { create(:pin) }

    let(:instance) do
      PinResource.find(id: pin.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Pin.count }.by(-1)
    end
  end
end
