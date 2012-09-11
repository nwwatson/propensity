module Propensity
  class Preference < ActiveRecord::Base
    attr_accessible :key, :name, :owner_id, :owner_type, :value, :value_type
  end
end
