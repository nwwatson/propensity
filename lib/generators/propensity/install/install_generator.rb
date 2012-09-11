require 'rails/generators/base'

module Propensity
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      def self.source_root
        @source ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      desc "This generator Propensity in to a Rails application"
      
      def add_configuration_and_initializers
        copy_file "app_configuration.rb", "app/models/app_configuration.rb"
      end
      
    end
  end
end