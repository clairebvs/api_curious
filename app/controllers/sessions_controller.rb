class SessionsController < ApplicationController
  # handle logging in #create and logging out #destroy

  def create
    user_info = request.env['omniauth.auth']
    user = User.find_by_provider_and_uid(user_info["provider"], user_info["uid"]) || User.create_with_omniauth(user_info)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end


end
