class FarmCatsController < ApplicationController
  before_action :set_farm_cat, only: [:show, :edit, :update, :destroy]

  # GET /farm_cats
  def index
    @farm_cats = FarmCat.all
  end

  # GET /farm_cats/1
  def show
  end

  # GET /farm_cats/new
  def new
    @farm_cat = FarmCat.new
  end

  # GET /farm_cats/1/edit
  def edit
  end

  # POST /farm_cats
  def create
    @farm_cat = FarmCat.new(farm_cat_params)

    if @farm_cat.save
      redirect_to @farm_cat, notice: 'Farm cat was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /farm_cats/1
  def update
    if @farm_cat.update(farm_cat_params)
      redirect_to @farm_cat, notice: 'Farm cat was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /farm_cats/1
  def destroy
    @farm_cat.destroy
    redirect_to farm_cats_url, notice: 'Farm cat was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_farm_cat
      @farm_cat = FarmCat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def farm_cat_params
      params.require(:farm_cat).permit(:name, :description, :main_image, :farm_cat_id)
    end
end
