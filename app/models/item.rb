class Item < ApplicationRecord
  has_one_attached :image
  has_many :shopping_cart_items
end

