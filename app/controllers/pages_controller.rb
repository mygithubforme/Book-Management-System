class PagesController < ApplicationController
  layout "Admin"

  before_action :confirmed_logged_in

  def index
    @pages=Page.sorted
  end

  def show
    @page=Page.find(params[:id])
  end

  def new
     @page=Page.new({:name => "Default"})
     @subjects= Subject.order('position ASC')
     @page_count= Page.count + 1
  end

  def create
     @page=Page.new(params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible))
    #Save the object.
    if @page.save
     #If succeed, redirect to idex action
      flash[:notice] = "Page created succesfully."
      redirect_to(:action => "show", :id => @page.id)
    else
      #If not, redisplay the form so user cansubject problems
      @subjects= Subject.order('position ASC')
      @page_count= Page.count + 1
      render('edit')
    end
  end

  def edit
    @page=Page.find(params[:id])
    @subjects= Subject.order('position ASC')
    @page_count= Page.count
  end

  def update
    @page=Page.find(params[:id])
    #Save the object.
    if @page.update_attributes(params.require(:page).permit(:subject_id ,:name, :permalink, :position, :visible))
     #If succeed, redirect to idex action
      flash[:notice] = "Page updated succesfully."
      redirect_to(:action => "show", :id => @page.id)
    else
      #If not, redisplay the form so user can fix problems
      @subjects= Subject.order('position ASC')
      @page_count= Page.count
      render('edit')
    end
  end

  def delete
    @page=Page.find(params[:id])
  end

  def destroy
    @page=Page.find(params[:id])

    @page.destroy
    flash[:notice]="Page '#{@page.name}' is destroyed"
    redirect_to(:action => "index")  
  end
end
