class SubjectsController < ApplicationController
  layout "Admin"

  before_action :confirmed_logged_in
  
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
    @subject_count=Subject.count + 1
  end

  def create
    #Instantiate a new Subject using form parameters
    @subject=Subject.new(params.require(:subject).permit(:name, :position, :visible))
    #Save the object.
    if @subject.save
     #If succeed, redirect to idex action
      flash[:notice] = "Subject created succesfully."
      redirect_to(:action => "index")
    else
      #If not, redisplay the form so user can fix problems
      @subject_count=Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count=Subject.count
  end

  def update
    @subject = Subject.find(params[:id])
    #Save the object.
    if @subject.update_attributes(params.require(:subject).permit(:name, :position, :visible,:created_at))
     #If succeed, redirect to idex action
      flash[:notice] = "Subject updated succesfully."
      redirect_to(:action => "show", :id => @subject.id)
    else
      #If not, redisplay the form so user can fix problems
      @subject_count=Subject.count
      render('edit')
    end

  end

  def delete
    @subject=Subject.find(params[:id])
  end

  def destroy
    @subject=Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed succesfully."
    redirect_to(:action => "index")
  end
end


