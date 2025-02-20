class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to @attraction
  end
  
  def show
    @attraction = Attraction.find_by(id: params[:id])
    @user = current_user
  end

  def index
    @user = current_user
    @attractions = Attraction.all
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)

    redirect_to @attraction
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end
