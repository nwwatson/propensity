module Propensity
  class Environment
    include EnvironmentExtension

    attr_accessor :preferences

    def initialize(configuration=nil)
      @preferences = configuration ? configuration.new : AppConfiguration.new
    end
  end
end