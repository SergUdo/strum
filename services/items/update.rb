# frozen_string_literal: true

module Items
  # Strum service
  # You service description here...
  class Update
    include Strum::Service
    def call
      output(Item.find(id: input[:id]))
      if output
        input.delete(:id)
        output.update(input)
      else
        add_error(:item, :not_found)
      end
    end

    def audit
      required(:id)
    end
  end
end
