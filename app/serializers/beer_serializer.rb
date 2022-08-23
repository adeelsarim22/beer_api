class BeerSerializer < ActiveModel::Serializer
  attribute(:identifier) { object.id }
  attributes :name, :description
end
