class Listing < ApplicationRecord
    belongs_to :user #dependent destroy
    has_one :category
end
