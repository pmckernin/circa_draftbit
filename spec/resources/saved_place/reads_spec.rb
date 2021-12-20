require 'rails_helper'

RSpec.describe SavedPlaceResource, type: :resource do
  describe 'serialization' do
    let!(:saved_place) { create(:saved_place) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(saved_place.id)
      expect(data.jsonapi_type).to eq('saved_places')
    end
  end

  describe 'filtering' do
    let!(:saved_place1) { create(:saved_place) }
    let!(:saved_place2) { create(:saved_place) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: saved_place2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([saved_place2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:saved_place1) { create(:saved_place) }
      let!(:saved_place2) { create(:saved_place) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            saved_place1.id,
            saved_place2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            saved_place2.id,
            saved_place1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
