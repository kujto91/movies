require 'httparty'

class MovieApiCaller
  include HTTParty
  base_uri ENV['MOVIES_API_URL']


  def initialize(movie_id)
    @options = {
      headers: header,
      query: query(movie_id),
    }
  end

  def load_movie_results
    self.class.get('/', @options)
  end

  private

  def header
    {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    }
  end

  def query(movie_id)
    {
      i: movie_id,
      apikey: ENV['MOVIES_API_KEY'],
    }
  end
end
