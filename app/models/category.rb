class Category < ApplicationRecord
  has_many :listings
  has_one_attached :picture
end
# has_many : listings the other side of belongs_to: category relationship. Category objects may (and do) have many instances in the listing model.
# has_one_attached :picture allows me to preload attached pictures using  -> .with_attached_picture scope
