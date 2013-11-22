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

  def test_show
    get :show, :id => @movie_1.id
    assert_response :success
    assert_equal @movie_1, assigns(:movie)
  end

  def test_edit
    get :edit, :id => @movie_1.id

    assert_response :success
    assert_template 'edit'
    assert_equal @movie_1, assigns(:movie)
    assert_equal 'Superman', @movie_1.title
    assert_equal 'PG-13', @movie_1.rating
    assert_equal 'Sat, 19 Nov 2011', @movie_1.released_on.inspect
    assert_equal 'This man is super cool! This man is super cool! This man is super cool! This man is super cool!', @movie_1.description
    assert_equal 1234124312349, @movie_1.total_gross
  end

  def test_update
    assert_no_difference ('Movie.count') do
      put :update, params.merge(:id => @movie_1.id)
    end

    @movie_1.reload

    assert_equal 'Donut', @movie_1.title
    assert_equal 'PG-66', @movie_1.rating
    assert_equal 'Mon, 05 Sep 2011', @movie_1.released_on.inspect
    assert_equal 'Donut is so sweet!', @movie_1.description
    assert_equal 987654321, @movie_1.total_gross
  end

  def test_new
    assert_no_difference ('Movie.count') do
      get :new
      assert_response :success
      assert_not_nil assigns(:movie)
    end
  end

  def test_create
    assert_difference ('Movie.count') do
      post :create, params
    end

    assert_redirected_to assigns(:movie)
  end

  def test_destroy
    @movie = Movie.create_exemplar!
    assert_difference ('Movie.count'), -1 do
      delete :destroy, :id => @movie.id
    end
  end

private
  def params
    {:movie => {
        :title => 'Donut',
        :rating => 'PG-66',
        :released_on => '2011-09-05',
        :description => 'Donut is so sweet!',
        :total_gross => 987654321
    }}
  end
end
