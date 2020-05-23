class PagesController < ApplicationController
 #only listings that are not sold will be visible  
 #the with_picture_attached scope ues pre_loading under the hood and greatly reduces database queries.
def index
  @listings = Listing.where(available: true).with_attached_picture.all.limit(100)

end
#search sanitizes user input by seperating the variable's search string from the condition query string in line with rails docs reccomendations for search safety. Search queries for listings title, author, keywords and ISBN for comprehensive search of available listings.
def search
    if params[:search].blank?
      redirect_to(root_path, alert: 'Empty field!')
    else
      @parameter = params[:search].downcase
      @listings = Listing.all.where('(title||author||keywords||isbn) LIKE :search', search: "%#{@parameter}%")
    end
  end


end
