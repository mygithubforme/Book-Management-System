class AdminUsersController < ApplicationController
  layout 'admin'
  before_action :confirmed_logged_in
  
  def index
    @adminusers=AdminUser.sorted
  end

  def new
    @adminuser=AdminUser.new
  end

  def create
    @adminuser=AdminUser.new(admin_user_params)

    if @adminuser.save
      flash[:notice]="Admin created successfully"
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
    @adminuser=AdminUser.find(params[:id])
  end

  def update
    @adminuser=AdminUser.find(params[:id])

    if @adminuser.update_attributes(admin_user_params)
      flash[:notice]="Admin updated successfully"
      redirect_to(:action => 'index')
    else
      render("edit")
    end 
  end

  

  def delete
    @adminuser=AdminUser.find(params[:id])
  end

  def destroy
    @adminuser=AdminUser.find(params[:id])
    @adminuser.destroy
    flash[:notice] ="Admin user '#{@adminuser.first_name}' deleted successfully"
    redirect_to(:action => 'index')
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(:first_name,:last_name,:email,:username,:password)
  end
end
