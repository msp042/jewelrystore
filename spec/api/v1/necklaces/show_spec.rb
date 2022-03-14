require "rails_helper"

RSpec.describe "necklaces#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/necklaces/#{necklace.id}", params: params
  end

  describe "basic fetch" do
    let!(:necklace) { create(:necklace) }

    it "works" do
      expect(NecklaceResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("necklaces")
      expect(d.id).to eq(necklace.id)
    end
  end
end
