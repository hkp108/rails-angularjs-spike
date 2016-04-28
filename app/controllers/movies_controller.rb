class MoviesController < ApplicationController
  respond_to :json

  def index
    render :json => Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    respond_to do |format|

    format.html # show.html.erb
    format.json { render json: @user }

 end
  end

  def create
    respond_with Movie.create(title_params)
  end

  def update

    respond_with Movie.update(title_params)
  end

  def destroy
    respond_with Movie.destroy(params[:id])
  end

  private

  def title_params
    params.require(:movie).permit(:title)
  end
end
