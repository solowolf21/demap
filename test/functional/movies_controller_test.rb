require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
    assert_equal ['Iron Man', 'Super Man', 'Spider Man'], assigns(:movies)
  end
end
