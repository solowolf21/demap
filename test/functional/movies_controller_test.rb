require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
    assert_equal 3, assigns(:movies).size
  end
end
