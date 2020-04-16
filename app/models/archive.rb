class Archive < ApplicationRecord
  validates :name,:price,:place,:purchase_date ,presence: true
end
