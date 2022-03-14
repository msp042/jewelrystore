class NecklacesController < ApplicationController
  before_action :set_necklace, only: %i[show edit update destroy]

  def index
    @q = Necklace.ransack(params[:q])
    @necklaces = @q.result(distinct: true).includes(:bookmarks,
                                                    :category).page(params[:page]).per(10)
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @necklace = Necklace.new
  end

  def edit; end

  def create
    @necklace = Necklace.new(necklace_params)

    if @necklace.save
      message = "Necklace was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @necklace, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @necklace.update(necklace_params)
      redirect_to @necklace, notice: "Necklace was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @necklace.destroy
    message = "Necklace was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to necklaces_url, notice: message
    end
  end

  private

  def set_necklace
    @necklace = Necklace.find(params[:id])
  end

  def necklace_params
    params.require(:necklace).permit(:category_id, :title, :price, :image)
  end
end
