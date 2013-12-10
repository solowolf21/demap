require 'ae_page_objects'

module DemapApp
  module PageObjects
    class Site < AePageObjects::Site
      def initialize!
        super

        root = File.expand_path('../..', File.dirname(__FILE__))

        matcher = /\A#{Regexp.escape(root)}\/(.*)\.rb\Z/
        Dir.glob(File.join(root, "page_objects/**/*.rb")).sort.each do |file|
          dependency_name = file.sub(matcher, '\1')
          require_dependency dependency_name
        end
      end
    end
  end
end
