require 'rails_helper'

describe MovieApiCaller do
  describe '#load_movie_results' do
    it 'returns movie details' do
      movie_id = 'tt1856101'

      movies_api_caller = MovieApiCaller.new(movie_id)
      movie = OpenStruct.new(movies_api_caller.load_movie_results.parsed_response)
      expect(movie.Title).to eq 'Blade Runner 2049'
    end
  end
end
