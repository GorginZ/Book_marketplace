class PagesController < ApplicationController
    
def index
end

def search
    if params[:search].blank?
      redirect_to(root_path, alert: 'Empty field!')
    else
      @parameter = params[:search].downcase
      @listings = Listing.all.where('lower(title) LIKE :search', search: "%#{@parameter}%")
    end
  end




end
