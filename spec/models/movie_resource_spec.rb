require 'rails_helper'

describe MovieResource do
  describe '#load_movies_data' do
    it 'returns movies details' do
      movie_resource = MovieResource.new
      movie_resource.load_movies_data
      @movies = movie_resource.movies

      expect(@movies.count).to eq 3
      expect(find_movie('tt2975590')).to be_present
      expect(find_movie('tt2015381')).to be_present
      expect(find_movie('tt1856101')).to be_present
    end
  end

  private

  def find_movie(movie_id)
    @movies.find{ |m| m.id == movie_id }
  end
end
