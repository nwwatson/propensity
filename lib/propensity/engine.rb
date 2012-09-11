module Propensity
  class Engine < ::Rails::Engine
    isolate_namespace Propensity

    initializer "propensity.load_preferences", :before => "application.environment" do
      ::ActiveRecord::Base.send :include, Propensity::Preferences::Preferable
    end
  end
end
