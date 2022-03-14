require 'rails_helper'

RSpec.describe "necklaces#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/necklaces/#{necklace.id}", payload
  end

  describe 'basic update' do
    let!(:necklace) { create(:necklace) }

    let(:payload) do
      {
        data: {
          id: necklace.id.to_s,
          type: 'necklaces',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(NecklaceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { necklace.reload.attributes }
    end
  end
end
