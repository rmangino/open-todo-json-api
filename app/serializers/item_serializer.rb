class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :complete, :created_at, :updated_at
end
