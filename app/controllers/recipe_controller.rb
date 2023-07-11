class RecipesController < ApplicationController
  def create
    if session[:user_id]
      recipe = Recipe.new(recipe_params)
      recipe.user_id = session[:user_id]
      if recipe.save
        render json: recipe, include: ['user'], status: :created
      else
        render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
   private
   def recipe_params
    params.require(:recipe).permit(:title, :instructions, :minutes_to_complete)
  end
end