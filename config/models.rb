# frozen_string_literal: true

require "sequel/model"
require "config/sequel.rb"

Sequel::Model.plugin(:auto_validations)
Sequel::Model.plugin(:constraint_validations)
Sequel::Model.plugin(:subclasses)
Sequel::Model.cache_associations = false if ENV["RACK_ENV"] == "development"

unless defined?(Unreloader)
  require "rack/unreloader"
  Unreloader = Rack::Unreloader.new(reload: false)
end

Unreloader.require("models") do |f|
  Sequel::Model.send(:camelize, File.basename(f).sub(/\.rb\z/, ""))
end
