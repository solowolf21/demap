require 'test_helper'

class MoviesControllerTest < ActionController::TestCase

  def setup
    @movie_1 = Movie.create_exemplar!(
        :title => 'Superman',
        :rating => 'PG-13',
        :total_gross => '1234124312349.99',
        :description => 'This man is super cool! This man is super cool! This man is super cool! This man is super cool!',
        :released_on => '2011-11-19'
    )

    @movie_2 = Movie.create_exemplar!(
        :title => 'Iron man',
        :rating => 'PG-11',
        :total_gross => '898124312349.99',
        :description => 'Iron man is super awesome! Iron man is super awesome! Iron man is super awesome! Iron man is super awesome!',
        :released_on => '2002-01-29'
    )
    @movie_3 = Movie.create_exemplar!(
        :title => 'Spiderman',
        :rating => 'PG',
        :total_gross => '123419.99',
        :description => 'Spider man is a dumb! Spider man is a dumb! Spider man is a dumb! Spider man is a dumb!',
        :released_on => '2009-10-13'
    )
  end

  def test_index
    get :index
    assert_response :success
    assert_equal 3, assigns(:movies).size
    assert_equal @movie_1, assigns(:movies)[0]
    assert_equal @movie_2, assigns(:movies)[1]
    assert_equal @movie_3, assigns(:movies)[2]
  end

end
