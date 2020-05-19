class Listing < ApplicationRecord
    belongs_to :user #dependent destroy
    has_one :category
    has_one :order
end
