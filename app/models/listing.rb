class Listing < ApplicationRecord
    belongs_to :user #dependent destroy
    belongs_to :category #should this be belongs_to?
    has_one :order
    has_one_attached :picture
end
