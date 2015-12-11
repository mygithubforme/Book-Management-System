class AccessController < ApplicationController
  layout 'admin'

  before_action :confirmed_logged_in, :except => [:login,:attempt_login,:logout]
  def index
  	#display text & links
  end

  def login
  	# login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
    	found_user=AdminUser.where(:username => params[:username]).first
    	if found_user
    		authorised_user= found_user.authenticate(params[:password])
    	end
    end

    if authorised_user
      session[:user_id]= authorised_user.id
      session[:username]=authorised_user.username
    	flash[:notice]="Yahooo!! You're logged in..."
    	redirect_to(:action => 'index')
    else
    	flash[:notice]="Invalid credentials..."
    	redirect_to(:action => 'login')
    end
  end

  def logout
    session[:user_id]=nil
    session[:username]=nil
  	flash[:notice]="Logged out"
  	redirect_to(:action => 'login')
  end

end
