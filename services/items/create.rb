# frozen_string_literal: true

module Items
  # Strum service
  # You service description here...
  class Create
    include Strum::Service

    def call
      if (item = Item.new(input)).valid?
        item.save
        output(item)
      else
        add_errors(item.errors)
      end
    end

    def audit
      # required(:key1, :key2)
    end
  end
end
