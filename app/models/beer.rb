class Beer < ApplicationRecord
  validates :name, :description, presence: true

  scope :by_name, ->(raw_name) { where('beers.name ILIKE ?', "%#{raw_name}%") if raw_name.present? }
end
