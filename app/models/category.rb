class Category < ApplicationRecord
  has_many :listings
  has_one_attached :picture
end
