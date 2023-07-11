class SessionsController < ApplicationController
  def destroy
    if session[:user_id]
      session[:user_id] = nil
      head :no_content
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end