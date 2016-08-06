class ProfessorsController < ApplicationController
	def index 
		if current_user.role == 'admin'
			@professors = Professor.all
		end
	end

	def new
		if current_user.role == 'admin' 
			@professor = Professor.new
		else
		  redirect_to professors_path
		  flash[:error] = "Something went wrong please try again!"
  	end
	end
	
	def create 
	  @professor = Professor.new(professor_params) 
	  if @professor.save 
      redirect_to professors_path
	  else 
	    render :new
      flash[:error] = "Something went wrong please try again!"
	  end 
	end

  def show
  	if current_user.role == 'admin' 
	  	params.inspect
	  	@professor = Professor.find(params[:id])
	  end
  end

  def edit
  	if current_user.role == 'admin' 
    	@professor = Professor.find(params[:id])
  	else
  		redirect_to professors_path
  	end
  end

  def update
    @professor = Professor.find(params[:id])
    if @professor.update_attributes(professor_params)
      redirect_to professor_path(@professor)
      flash[:notice] = "Successfully edited user!"
    else
      render :edit
    end
  end

 def destroy
 	if current_user.role == 'admin' 
  	Professor.destroy(params[:id])
  end
  redirect_to professors_path
 end

  private
    def professor_params
      params.require(:professor).permit(:first_name, :last_name, :title)
    end
end
