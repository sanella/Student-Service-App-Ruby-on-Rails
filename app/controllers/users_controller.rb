class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create 
	  @user = User.new(user_params) 
	  if @user.save 
	    session[:user_id] = @user.id 
      redirect_to '/' 
	  else 
	    redirect_to '/register' 
      flash[:error] = "Please try again"
	  end 
	end

	def show
    if (current_user).role == 'admin'
      user_id = params[:id]
      @user = User.find(user_id)
    else #error
		  @user = User.find(session[:user_id])
    end
	end

	 def edit  
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to user_path(@user)
    else 
       flash[:error] = "Please try again"
      render :edit
    end
  end

  def index
  	if (current_user).role == 'admin' #error
  		@users = User.all
  	else
      redirect_to '/'
  	end
  end

  def destroy
    if current_user.role == 'admin'
      User.find(params[:id]).destroy
      puts 'admin if'
    else 
      puts 'user if'
      User.find(session[:user_id]).destroy
      session[:user_id] = nil 
    end
    redirect_to '/'
    flash[:success] = "User deleted"
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :year, :department, :date_of_birth)
    end

    def admin_params
      params.require(:user).permit(:email, :first_name, :last_name)
    end
end
