class PagesController < ApplicationController
    
def index
  @listings = Listing.where(available: true)

end
#search sanitizes user input by seperating the variable search string from the conditions string in line with rails docs reccomendations for search safety. Search queries for listings title, author, keywords and ISBN for comprehensive search of available listings.
def search
    if params[:search].blank?
      redirect_to(root_path, alert: 'Empty field!')
    else
      @parameter = params[:search].downcase
      @listings = Listing.all.where('(title||author||keywords||isbn) LIKE :search', search: "%#{@parameter}%")
    end
  end


end
