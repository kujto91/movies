class MoviesController < ApplicationController
  before_action :all_movies, only: [:index, :show]

  def index
    @movies = @movies.sort_by(&:year).reverse
  end

  def show
    @movie = @movies.find{ |m| m.id == params[:id] }
  end

  private

  def all_movies
    movie_resource = MovieResource.new
    movie_resource.load_movies_data
    @movies = movie_resource.movies
  end
end
