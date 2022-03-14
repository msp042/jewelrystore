require 'rails_helper'

RSpec.describe "necklaces#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/necklaces/#{necklace.id}"
  end

  describe 'basic destroy' do
    let!(:necklace) { create(:necklace) }

    it 'updates the resource' do
      expect(NecklaceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Necklace.count }.by(-1)
      expect { necklace.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
