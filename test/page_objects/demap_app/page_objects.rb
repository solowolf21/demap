require 'ae_page_objects'
require 'active_support/dependencies'

module DemapApp
  module PageObjects
  end
end

root_page_objects_path = File.expand_path('..', File.dirname(__FILE__))

$LOAD_PATH << root_page_objects_path
ActiveSupport::Dependencies.autoload_paths << root_page_objects_path

require 'demap_app/page_objects/site'
require 'demap_app/page_objects/login_page'
