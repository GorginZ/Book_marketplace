class Listing < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :category 
    has_one :order
    has_one_attached :picture
end
#has_one_attached :picture allows me to preload attached pictures using  -> .with_attached_picture scope. I am able to do this because of this relationship.
#belongs_to :category -> each listing 'belongs to' one instance of category model.
#dependent destroy makes deleting listings much easier if a user deletes their acc. This won't cause any problems for purchased listings because they will exist as order objects.
