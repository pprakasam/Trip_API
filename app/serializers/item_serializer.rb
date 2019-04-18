class ItemSerializer < ActiveModel::Serializer
  attributes :id, :item_name, :assigned_to
end
