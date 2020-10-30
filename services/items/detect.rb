# frozen_string_literal: true

module Items
  # Strum service
  # You service description here...
  class Find
    include Strum::Service

    def call
      if (items = Items::Search(input)).count.eql?(1)
        output(resources_name: items.first)
      elsif items.count > 1
        add_error(:item, :criteria_wrong)
      else
        add_error(:item, :not_found)
      end
    end

    def audit
      @input = @input.slice(:id)
      required(:id)
    end
  end
end
