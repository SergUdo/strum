# frozen_string_literal: true

require "fast_jsonapi"

# Strum service
# You model description here...
class ItemSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash
  attributes :id
end
