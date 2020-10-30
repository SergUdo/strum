# frozen_string_literal: true

Sequel.migration do
  change do
    extension(:constraint_validations)
    create_table(:items) do
      primary_key :id

      column :name,        String,    null: false
      column :description, String

      column :created_at,  DateTime,  null: false
      column :updated_at,  DateTime
    end
  end
end
