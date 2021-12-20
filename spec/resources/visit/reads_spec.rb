require 'rails_helper'

RSpec.describe VisitResource, type: :resource do
  describe 'serialization' do
    let!(:visit) { create(:visit) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(visit.id)
      expect(data.jsonapi_type).to eq('visits')
    end
  end

  describe 'filtering' do
    let!(:visit1) { create(:visit) }
    let!(:visit2) { create(:visit) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: visit2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([visit2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:visit1) { create(:visit) }
      let!(:visit2) { create(:visit) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            visit1.id,
            visit2.id
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
            visit2.id,
            visit1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
