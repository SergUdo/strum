# frozen_string_literal: true

module Items
  # Strum service
  # You service description here...
  class Search
    include Strum::Service

    def call
      output(Item.all)
    end

    def audit
      # required(:key1, :key2)
    end
  end
end
