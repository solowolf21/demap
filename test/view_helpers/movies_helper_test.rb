require 'test_helper'
class MoviesHelperTest < ActionView::TestCase
  def setup
    @movie_1 = Movie.create_exemplar!(
        :title => 'Superman',
        :rating => 'PG-13',
        :total_gross => '1234124312349.99',
        :description => 'This man is super cool! This man is super cool! This man is super cool! This man is super cool!',
        :released_on => '2013-11-19',
        :duration => '150min'
    )

    @movie_2 = Movie.create_exemplar!(
        :title => 'Iron man',
        :rating => 'NC-17',
        :total_gross => '898124312349.99',
        :description => 'Iron man is super awesome! Iron man is super awesome! Iron man is super awesome! Iron man is super awesome!',
        :released_on => '2011-01-29',
        :duration => '120min'
    )
    @movie_3 = Movie.create_exemplar!(
        :title => 'Spiderman',
        :rating => 'PG',
        :total_gross => '123419.99',
        :description => 'Spider man is a dumb! Spider man is a dumb! Spider man is a dumb! Spider man is a dumb!',
        :released_on => '2009-10-13',
        :duration => '140min'
    )
  end

  def test_format_total_gross
    assert_equal '$1,234,124,312,349.00', view.format_total_gross(@movie_1)
    assert_equal '<strong>Flop!</strong>', view.format_total_gross(@movie_3)
  end

  def test_format_average_stars
    assert_equal '<strong>No reviews</strong>', view.format_average_stars(@movie_1)

    Review.create_exemplar!(:movie => @movie_1, :stars => 1)
    Review.create_exemplar!(:movie => @movie_1, :stars => 2)
    Review.create_exemplar!(:movie => @movie_1, :stars => 3)

    @movie_1.reload
    assert_equal '2.0 stars', view.format_average_stars(@movie_1)

    Review.create_exemplar!(:movie => @movie_1, :stars => 5)

    @movie_1.reload
    assert_equal '2.8 stars', view.format_average_stars(@movie_1)
  end

end