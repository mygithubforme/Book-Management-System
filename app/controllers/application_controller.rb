class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def confirmed_logged_in
    unless session[:user_id]
      flash[:notice]="No no no...Log in please!!!"
      redirect_to(:controller => "access",:action => "login")
      return false #halts process
    else 
      return true
    end
  end
end
