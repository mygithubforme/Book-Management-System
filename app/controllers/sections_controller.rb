class SectionsController < ApplicationController
  
  layout "Admin"

  before_action :confirmed_logged_in

  def index
    @sections=Section.sorted
  end

  def show
    @section=Section.find(params[:id])
  end

  def new
    @section=Section.new({:name => "Default"})
    @pages=Page.order("position ASC")
    @section_count=Section.count + 1
  end

  def create
    @section=Section.new(params.require(:section).permit(:page_id, :name, :content, :content_type, :position, :visible))

    if @section.save
      flash[:notice]="Section successfully created" 
      redirect_to(:action => "index")
    else
      @pages=Page.order("position ASC")
      @section_count=Section.count + 1
      render("new")
    end

  end


  def edit
    @section=Section.find(params[:id])
    @pages=Page.order("position ASC")
    @section_count=Section.count
  end

  def update
    @section=Section.find(params[:id])
    if @section.update_attributes(params.require(:section).permit(:page_id, :name, :content, :content_type, :position, :visible))
      flash[:notice]= "Section successfully updated"
      redirect_to(:action => "show",:id => @section.id)   
    else
      @pages=Page.order("position ASC")
      @section_count=Section.count
      render("edit")
    end
 end

  def delete
    @section=Section.find(params[:id])
  end

  def destroy
    @section=Section.find(params[:id])
    @section.destroy
    flash[:notice]="Section '#{@section.name}' successfully deleted"
    redirect_to(:action => "index")

  end
end
