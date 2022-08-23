class Api::V1::BeersController < ApplicationController
  def index
    @beers = Beer.by_name(params[:by_name]).order(id: :desc).page(params[:page] || 1).per(records_per_page)
    render json: @beers, each_serializer: BeerSerializer, meta: pagination_dict(@beers)
  end

  def create
    @beer = Beer.create!(beer_params)
    render json: @beer, status: :created
  end

  def show
    @beer = Beer.find(params[:id])
    render json: @beer
  end

  def random
    @beer = Beer.order(Arel.sql('RANDOM()')).first
    if @beer.blank?
      render json: { beer: {} }
    else
      render json: @beer
    end
  end

  private

  def records_per_page
    params[:per_page] || 10
  end

  def beer_params
    params.require(:beer).permit(:name, :description)
  end

  def pagination_dict(collection)
    {
      current_page: collection.current_page,
      per_page: collection.limit_value,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end
end
