class MovieResource include ActiveModel::Model
  attr_accessor :id
  attr_accessor :title
  attr_accessor :plot
  attr_accessor :genre
  attr_accessor :director
  attr_accessor :released
  attr_accessor :runtime
  attr_accessor :year
  attr_accessor :rated
  attr_accessor :poster
  attr_accessor :movies

  def load_movies_data
    results = []

    movie_ids.each do |movie_id|
      load_movie_data(movie_id)
      tmp_result = create_movie_resource(movie_id, @movie)
      results.push(tmp_result)
    end

    self.movies = results
  end

  private

  def load_movie_data(movie_id)
    movies_api_caller = MovieApiCaller.new(movie_id)
    @movie = OpenStruct.new(movies_api_caller.load_movie_results.parsed_response)
  end

  def create_movie_resource(movie_id, movie)
    MovieResource.new(
      id: movie_id,
      title: movie.Title,
      plot: movie.Plot,
      genre: movie.Genre,
      director: movie.Director,
      released: movie.Released,
      runtime: movie.Runtime,
      year: movie.Year,
      rated: movie.Rated,
      poster: movie.Poster,
    )
  end

  def movie_ids
    [
      'tt2975590',
      'tt2015381',
      'tt1856101',
    ]
  end
end
