require 'rails_helper'

RSpec.describe SavedPlaceResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'saved_places',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SavedPlaceResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { SavedPlace.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:saved_place) { create(:saved_place) }

    let(:payload) do
      {
        data: {
          id: saved_place.id.to_s,
          type: 'saved_places',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SavedPlaceResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { saved_place.reload.updated_at }
      # .and change { saved_place.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:saved_place) { create(:saved_place) }

    let(:instance) do
      SavedPlaceResource.find(id: saved_place.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { SavedPlace.count }.by(-1)
    end
  end
end
