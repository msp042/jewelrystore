require "rails_helper"

RSpec.describe NecklaceResource, type: :resource do
  describe "serialization" do
    let!(:necklace) { create(:necklace) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(necklace.id)
      expect(data.jsonapi_type).to eq("necklaces")
    end
  end

  describe "filtering" do
    let!(:necklace1) { create(:necklace) }
    let!(:necklace2) { create(:necklace) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: necklace2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([necklace2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:necklace1) { create(:necklace) }
      let!(:necklace2) { create(:necklace) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      necklace1.id,
                                      necklace2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      necklace2.id,
                                      necklace1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
