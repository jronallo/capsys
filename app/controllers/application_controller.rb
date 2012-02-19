class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
    
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    if !current_user
      redirect_to :back, :notice => 'You must be logged in to do that!'
    end      
  end
end
