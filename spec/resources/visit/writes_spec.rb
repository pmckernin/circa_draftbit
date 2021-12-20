require 'rails_helper'

RSpec.describe VisitResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'visits',
          attributes: { }
        }
      }
    end

    let(:instance) do
      VisitResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Visit.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:visit) { create(:visit) }

    let(:payload) do
      {
        data: {
          id: visit.id.to_s,
          type: 'visits',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      VisitResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { visit.reload.updated_at }
      # .and change { visit.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:visit) { create(:visit) }

    let(:instance) do
      VisitResource.find(id: visit.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Visit.count }.by(-1)
    end
  end
end
