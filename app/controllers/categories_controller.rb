class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @categories = Category.all
      end
    
      # GET /listings/1
      # GET /listings/1.json
      def show
      end
    
      # GET /listings/new
      def new
        @category = Category.new
      end
    
      # GET /listings/1/edit
      def edit
      end
    
      # POST /listings
      # POST /listings.json
      def create
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
    
      # DELETE /listings/1
      # DELETE /listings/1.json
      def destroy
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
          params.require(:category).permit(:book_category, :summary) # should this be params.require(:book_category).permit(:book_category)
        end
end
