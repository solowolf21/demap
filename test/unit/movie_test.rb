require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  def test_flop
    movie = Movie.create_exemplar!(:total_gross => 1)
    assert movie.flop?
    movie.update_attributes!(:total_gross => 99999999999)
    assert !movie.flop?
  end

  def test_setter_getter
    movie = Movie.create_exemplar!
    movie.title       = 'Flix'
    movie.rating      = 'PG-88'
    movie.description = 'The movie is fair.'
    movie.released_on = '2011-08-06'
    movie.total_gross = 7777777
    movie.save!

    movie.reload
    assert_equal 'Flix', movie.title
    assert_equal 'PG-88', movie.rating
    assert_equal 'The movie is fair.', movie.description
    assert_equal 'Sat, 06 Aug 2011', movie.released_on.inspect
    assert_equal 7777777, movie.total_gross
  end

  def test_released
    movie_1 = Movie.create_exemplar!(:released_on => Date.today << 12)
    movie_2 = Movie.create_exemplar!(:released_on => Date.today >> 5)
    movie_3 = Movie.create_exemplar!(:released_on => Date.today << 9)
    movie_4 = Movie.create_exemplar!(:released_on => Date.today << 22)

    movies = Movie.released
    assert_equal 3, movies.size
    assert_equal movie_3, movies[0]
    assert_equal movie_1, movies[1]
    assert_equal movie_4, movies[2]
  end
end
