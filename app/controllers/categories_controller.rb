class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  #only users who are authenticated can perform CRUD
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
    def index
        @categories = Category.all
      end
      # GET /listings/1
      # GET /listings/1.json

      #this below query accesses all listings with a category_id equal to the selected category object. category_id is a foreign key attribute in listings and corresponds to the primary key of a category object. This below query allows me to access all listings with the given category ID. This feeds the view with the correct Listings objects when users clicks 'categories' -> 'a category (eg law)' -> then renders all listings with a category_id foreign key equal to  primary key of the law category object.
      def show
       @category_listing = Listing.where("category_id = ?", params[:id])
      end
    
      # GET /listings/new
      #new instance of Category object
      #this is only available to admins due to cancancan authorize line
      def new
        @category = Category.new
        authorize! :create, @category
      end
    
      # GET /listings/1/edit
      #this is only available to admins due to cancancan authorize line

      def edit
        authorize! :edit, @category

      end
    
      # POST /listings
      # POST /listings.json
      #this is only available to admins due to cancancan authorize line. This is because the categories must be organised correctly in the database, BECAUSE when users creates a Listing object, they select the category from the category objects that are created by admin users from a drop down. So having CRUD for categories means I can help prevent invalid input from users and  avoid duplication while also making creating a listing easy for sellers.
      def create
        authorize! :create, @category
        @category = Category.new(category_params)
    
        respond_to do |format|
          if @category.save
            format.html { redirect_to @category, notice: 'Category was successfully created.' }
            format.json { render :show, status: :created, location: @category }
          else
            format.html { render :new }
            format.json { render json: @category.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # PATCH/PUT /listings/1
      # PATCH/PUT /listings/1.json
      #cancancan authorization for CRUD users can only CRUD their own objects
      def update
        authorize! :update, @category

        respond_to do |format|
          if @category.update(category_params)
            format.html { redirect_to @category, notice: 'category was successfully updated.' }
            format.json { render :show, status: :ok, location: @category }
          else
            format.html { render :edit }
            format.json { render json: @category.errors, status: :unprocessable_entity }
          end
        end
      end

      def listing_categories
        @listings = category_id.listings   #will this
      end
    
      # DELETE /listings/1
      # DELETE /listings/1.json
      def destroy
        authorize! :destroy, @category

        @category.destroy
        respond_to do |format|
          format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
        # allows category objects to be renderd in views that are associated with the correct category_id
        def set_category
          @category = Category.find(params[:id])
        end
    
        # All of these params are necessary for funcitonality and allow category objects to be visible and manipulated in other controller actions where ncessary
        def category_params
          params.require(:category).permit(:book_category, :summary, :category, :category_id, :category, :picture) 
        end
end
