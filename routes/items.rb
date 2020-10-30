# frozen_string_literal: true

# Branch route /items
class DemoStrumApp
  hash_branch "items" do |req| # rubocop: disable Metrics/BlockLength
    req.get(true) do
      Items::Search.call(req.params) do |m|
        m.success { |items| ItemSerializer.new(items).serializable_hash }
        m.failure { |errors| response.status = :unprocessable_entity; errors }
      end
    end
    req.post(true) do
      Items::Create.call(req.params) do |m|
        m.success { |item| response.status = :created; ItemSerializer.new(item).serializable_hash }
        m.failure { |errors| response.status = :unprocessable_entity; errors }
      end
    end

    req.on String do |item_id|
      item_params = req.params.merge(id: item_id)
      req.get(true) do
        Items::Find.call(item_params) do |m|
          m.success { |item| ItemSerializer.new(item).serializable_hash }
          m.failure(:not_found) { nil }
          m.failure { |errors| response.status = :unprocessable_entity; errors }
        end
      end
      req.patch(true) do
        Items::Update.call(item_params) do |m|
          m.success { |updated_item| ItemSerializer.new(updated_item).serializable_hash }
          m.failure(:not_found) { nil }
          m.failure { |errors| response.status = :unprocessable_entity; errors }
        end
      end
      req.delete(true) do
        Items::Delete.call(item_params) do |m|
          m.success { response.status = :ok; nil }
          m.failure(:not_found) { nil }
          m.failure { |errors| response.status = :unprocessable_entity; errors }
        end
      end
    end
  end
end
