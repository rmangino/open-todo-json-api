class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at, :updated_at, :items
end
