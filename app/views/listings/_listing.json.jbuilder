json.extract! listing, :id, :title, :ISBN, :author, :category, :keywords, :available, :visible, :created_at, :updated_at
json.url listing_url(listing, format: :json)
