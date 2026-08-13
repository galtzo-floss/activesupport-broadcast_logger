# frozen_string_literal: true

module ActiveSupport
  module BroadcastLogger
    # Version namespace for this gem.
    module Version
      # Current gem version.
      VERSION = "3.0.1"
    end
    # Current gem version exposed at the traditional constant location.
    VERSION = Version::VERSION # Traditional Constant Location
  end
end
