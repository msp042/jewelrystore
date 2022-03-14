class Api::V1::NecklacesController < Api::V1::GraphitiController
  def index
    necklaces = NecklaceResource.all(params)
    respond_with(necklaces)
  end

  def show
    necklace = NecklaceResource.find(params)
    respond_with(necklace)
  end

  def create
    necklace = NecklaceResource.build(params)

    if necklace.save
      render jsonapi: necklace, status: 201
    else
      render jsonapi_errors: necklace
    end
  end

  def update
    necklace = NecklaceResource.find(params)

    if necklace.update_attributes
      render jsonapi: necklace
    else
      render jsonapi_errors: necklace
    end
  end

  def destroy
    necklace = NecklaceResource.find(params)

    if necklace.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: necklace
    end
  end
end
