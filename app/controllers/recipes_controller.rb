class RecipesController < ApplicationController
	
	before_action :set_recipe, only: [:show, :edit, :update, :destroy]

	def index
		@recipe = Recipe.all.order("created_at DESC")
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			flash[:notice] = "Successfully created a recipe"
			redirect_to @recipe
		else
			flash.now[:error] = "Please try again. Couldn't save recipe"
			render 'new'
		end
	end

	def show
       
	end

    def edit

    end

    def update
    	if @recipe.update(recipe_params)
    		redirect_to @recipe, notice: "Successfully updated recipe"
    	else
    		flash.now[:error] = "Couldn't update the recipe"
    		render 'edit'
    	end
    end

    def destroy
       @recipe.destroy
       redirect_to root_path, notice: "Successfully deleted recipe"
    end

	private
	def set_recipe
		@recipe = Recipe.find(params[:id])
	end

	def recipe_params
		params.require(:recipe).permit(:title, :description, :image)
	end

end
