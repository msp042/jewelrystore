require "rails_helper"

RSpec.describe "necklaces#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/necklaces", params: params
  end

  describe "basic fetch" do
    let!(:necklace1) { create(:necklace) }
    let!(:necklace2) { create(:necklace) }

    it "works" do
      expect(NecklaceResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["necklaces"])
      expect(d.map(&:id)).to match_array([necklace1.id, necklace2.id])
    end
  end
end
