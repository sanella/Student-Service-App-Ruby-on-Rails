class SubjectsController < ApplicationController
	def index 
		if current_user.role == 'admin'
			@subjects = Subject.all
		end
	end

	def new
		if current_user.role == 'admin' 
			@subject = Subject.new
		else
		  redirect_to subjects_path
		  flash[:error] = "Something went wrong please try again!"
  	end
	end
	
	def create 
	  @subject = Subject.new(subject_params) 
	  if @subject.save 
      redirect_to subjects_path
	  else 
	    render :new
      flash[:error] = "Something went wrong please try again!"
	  end 
	end

  def show
  	if current_user.role == 'admin' 
	  	params.inspect
	  	@subject = Subject.find(params[:id])
	  end
  end

  def edit
  	if current_user.role == 'admin' 
    	@subject = Subject.find(params[:id])
  	else
  		redirect_to subjects_path
  	end
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      redirect_to subjects_path(@subject)
      flash[:notice] = "Successfully edited!"
    else
      render :edit
    end
  end

 def destroy
 	if current_user.role == 'admin' 
  	Subject.destroy(params[:id])
  end
  redirect_to subjects_path
 end

  private
    def subject_params
      params.require(:subject).permit(:name, :etcs, :year)
    end
end
