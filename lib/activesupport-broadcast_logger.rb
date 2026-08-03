# External libraries
require "active_support/version"
require "version_gem"

# This library
require_relative "activesupport/broadcast_logger/version"

# Loads supporting features from Rails v5, 6, or 7
require "active_support/core_ext/module/delegation"
require "active_support/core_ext/object/blank"

# Require the extracted-from-Rails-8 ActiveSupport::Logger
require "activesupport-logger"

# !!ORDER MATTERS!!

# Extracted from:
# https://github.com/rails/rails/blame/6041bd04e8be0ec3b5e850f66fe932a8f5941237/activesupport/lib/active_support/broadcast_logger.rb
# which at the time was the latest version of the file from Rails PR 53093:
# Compare SHA with latest commit to the same file on `main` to check for changes:
# https://github.com/rails/rails/pull/53093/files
#
# All this reloading might print warnings about redefined methods, and this is expected.
# Technically it might even break things, but we don't expect it to, and YMMV.
require_relative "activesupport/broadcast_logger"

# Namespace for the Version of this gem (and nothing else)
module Activesupport
end

Activesupport::BroadcastLogger::Version.class_eval do
  extend VersionGem::Basic
end
