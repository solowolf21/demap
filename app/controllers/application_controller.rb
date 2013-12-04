class ApplicationController < ActionController::Base
  before_filter :authenticate_user!

  protect_from_forgery

  private
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
