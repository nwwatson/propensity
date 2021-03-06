# StoreInstance has a persistence flag that is on by default,
# but we disable database persistence in testing to speed up tests
#

require 'singleton'

module Propensity
  module Preferences

    class StoreInstance
      attr_accessor :persistence

      def initialize
        @cache = Rails.cache
        @persistence = true
        load_preferences
      end

      def set(key, value, type)
        @cache.write(key, value)
        persist(key, value, type)
      end

      def exist?(key)
        Propensity::Preference.exists?(key: key)
      end

      def get(key)
        #@cache.read(key)
        Propensity::Preference.find_or_initialize_by(key: key).value
      end

      def delete(key)
        @cache.delete(key)
        destroy(key)
      end

      private

      def persist(cache_key, value, type)
        return unless should_persist?

        preference = Propensity::Preference.find_or_initialize_by(key: cache_key)
        preference.value = value
        preference.value_type = type
        preference.save
      end

      def destroy(cache_key)
        return unless should_persist?

        preference = Propensity::Preference.find_by(key: cache_key)
        preference.destroy if preference
      end

      def load_preferences
        return unless should_persist?

        Propensity::Preference.all.each do |p|
          @cache.write(p.key, p.value)
        end
      end

      def should_persist?
        @persistence
      end

    end

    class Store < StoreInstance
      include Singleton
    end

  end
end
