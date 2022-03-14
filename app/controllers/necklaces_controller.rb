class NecklacesController < ApplicationController
  before_action :set_necklace, only: [:show, :edit, :update, :destroy]

  # GET /necklaces
  def index
    @necklaces = Necklace.all
  end

  # GET /necklaces/1
  def show
  end

  # GET /necklaces/new
  def new
    @necklace = Necklace.new
  end

  # GET /necklaces/1/edit
  def edit
  end

  # POST /necklaces
  def create
    @necklace = Necklace.new(necklace_params)

    if @necklace.save
      redirect_to @necklace, notice: 'Necklace was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /necklaces/1
  def update
    if @necklace.update(necklace_params)
      redirect_to @necklace, notice: 'Necklace was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /necklaces/1
  def destroy
    @necklace.destroy
    message = "Necklace was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to necklaces_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_necklace
      @necklace = Necklace.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def necklace_params
      params.require(:necklace).permit(:category_id, :title, :price, :image)
    end
end
