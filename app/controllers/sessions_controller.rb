class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.find_or_initialize_by(uid: auth['uid'])
    user.token = auth['credentials']['token']
    user.name = auth['info']['name']
    user.save
    session[:user_id] = user.id
    flash[:success] = "Welcome, #{user.name}!"
    redirect_to new_video_path
  end
 
  def fail
    render text: "Sorry, but the following error has occured: #{params[:message]}. Please try again or contact
administrator."
  end
end
