class SearchesController < ApplicationController
  # GET /searches
  # GET /searches.json
  def index
    @searches = Search.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searches }
    end
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @search = Search.find(params[:id])
    #@recipes = Recipe.with_ingredient_in(@ingred_arr) # Recipe results
   # @search = Search.find(params[:id])
  #@results = Recipe.with_ingredient_in(@ingred_arr)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/new
  # GET /searches/new.json
  def new
    @search = Search.new

    #respond_to do |format|
    #  
    #  format.html 
    #  format.json { render json: @search }
    # end
  end
 
  # GET /searches/1/edit
  def edit
    @search = Search.find(params[:id])
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(params[:search]) #query string
    @query_arr = @search.query.split(",")
    @s = @search.ingredients
    for word in @query_arr
      #construct ingredients object
      ing = Ingredient.find_by_name(word)
      @s.push(ing)
    end

    @search.save
    redirect_to @search
  end

  # PUT /searches/1
  # PUT /searches/1.json
  def update
    @search = Search.find(params[:id])

    respond_to do |format|
      if @search.update_attributes(params[:search])
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search = Search.find(params[:id])
    @search.destroy

    respond_to do |format|
      format.html { redirect_to searches_url }
      format.json { head :no_content }
    end
  end

   #private
    #def check_ingredients
     # @ingredient_tag = params[:ingredient]
   # end
end
