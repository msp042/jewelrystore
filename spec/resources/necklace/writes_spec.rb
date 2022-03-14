require 'rails_helper'

RSpec.describe NecklaceResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'necklaces',
          attributes: { }
        }
      }
    end

    let(:instance) do
      NecklaceResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Necklace.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:necklace) { create(:necklace) }

    let(:payload) do
      {
        data: {
          id: necklace.id.to_s,
          type: 'necklaces',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      NecklaceResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { necklace.reload.updated_at }
      # .and change { necklace.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:necklace) { create(:necklace) }

    let(:instance) do
      NecklaceResource.find(id: necklace.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Necklace.count }.by(-1)
    end
  end
end
