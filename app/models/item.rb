class Item < ApplicationRecord
  has_many :trips
  belongs_to :user
end
