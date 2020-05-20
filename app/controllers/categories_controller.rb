class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
# load_and_authorize_resource
    def index
        @categories = Category.all
      end
    
      # GET /listings/1
      # GET /listings/1.json
      def show
      #  @category_listing = Listing.select{ |listing| listing.category_id == @categegory_id }
       @category_listing = Listing.where("category_id = ?", params[:id])
      end
    
      # GET /listings/new
      def new
        @category = Category.new
        authorize! :create, @category
      end
    
      # GET /listings/1/edit
      def edit
        authorize! :edit, @category

      end
    
      # POST /listings
      # POST /listings.json
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
        # Use callbacks to share common setup or constraints between actions.
        def set_category
          @category = Category.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def category_params
          params.require(:category).permit(:book_category, :summary, :category, :category_id, :category, :picture) # should this be params.require(:book_category).permit(:book_category)
        end
end
