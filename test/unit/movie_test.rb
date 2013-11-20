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
end
