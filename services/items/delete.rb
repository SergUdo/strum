# frozen_string_literal: true

module Items
  # Strum service
  # You service description here...
  class Delete
    include Strum::Service

    def call
      if (item = Item.find(input))
        item.delete
      else
        add_error(:item, :not_found)
      end
    end

    def audit
      required(:id)
    end
  end
end
