class UsersController < ApplicationController
  def create
    # Create user logic...
  end
   def show
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      render json: { id: user.id, username: user.username, image_url: user.image_url, bio: user.bio }, status: :ok
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
   private
   def user_params
    params.require(:user).permit(:username, :password, :image_url, :bio)
  end
end