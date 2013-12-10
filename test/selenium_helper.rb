ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'page_objects/demap_app/page_objects'
require 'capybara/rails'

DemapApp::PageObjects::Site.initialize!

class SeleniumTestCase < ActiveSupport::TestCase
  include Capybara::DSL
end