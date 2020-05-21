class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # load_and_authorize_resource



  # GET /listings
  # GET /listings.json
    #The below query is one part of ensuring when a listing is sold it won't render in browsing. 
    #the other part of this is the webhook action in payments controller. It changes Listing objects attribute 'available' to false and saves the listing object
  # only listings that are not sold (available = true) will render so there aren't problematic duplicates of liistings
  def index
    @listings = Listing.where(available: true)
  end

  # GET /listings/1
  # GET /listings/1.json
  #category_id is a forieng key attribute in listings objects which corresponds to the primary key of a category object. This is an interger value of course, so in order to access the english word book_category (eg Law) in the show view (line 20 @category_id.book_category) I need this query to find the correct category object corresponding to the listing. I store this as an instance variable so I can then call .book_category to get the english word title for the instance of the category object
  def show
     @category_id = Category.find_by_id(@listing.category_id)
  end

  # GET /listings/new
  #In my new listing form I have users select a book category from a drop down menu. This is to prevent user input errors and to safegruard against duplications in the database but it also makes things easier for the seller user. 
  #The instance variable @all_categories stores a collection of all Category objects' book_category (the english word titles and the category_ids and the cateogry_id is what is actually assigned to the Listing object as a foreign key attribute, but the book_category is needed as it is the English Word title that the viewers can select from.
  def new
    @listing = Listing.new
    @all_categories = Category.all.collect{ |c| [c.book_category, c.id] }

  end

  # GET /listings/1/edit
  #same as above re all_categoryes
  #authorization called. edit action is first argument and the instance of listing object in question is the second argument
  def edit
    @all_categories = Category.all.collect{ |c| [c.book_category, c.id] }
    authorize! :edit, @listing

  end

  # POST /listings
  # POST /listings.json
  #the new instance of listing object gets the following attributes: it belongs to the current_user and it is also fed params from the above new method as arguments (collected in the view form). The new action receives the attributes of the new instance of the listing object as the arguments (listing_params)
  def create
    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end
      # users can view their listings which are sorted by whether they are sold or not. sold listings become available: false when that listing object is associated with a new order object in payment controller webhook action
  def my_listings
    @listings = current_user.listings.where(available: true)
   @sold_listings = current_user.listings.where(available: false)


  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :isbn, :author, :category_id, :keywords, :available, :price, :picture)
    end
end
