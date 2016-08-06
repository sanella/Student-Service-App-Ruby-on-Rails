class PostsController < ApplicationController

	def index
    @posts = Post.paginate(:page => params[:page], :per_page => 8)
	end

	def new
		if (current_user).role == 'admin'
			@post = Post.new
		else
			redirect_to '/posts'
		end
	end

	def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
  	params.inspect
  	@post = Post.find(params[:id])
  end

  def edit
  	if (current_user).role == 'admin' 
    	@post = Post.find(params[:id])
  	else
  		redirect_to '/posts'
  	end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

 def destroy
 	if (current_user).role == 'admin' 
  	Post.destroy(params[:id])
  end
  redirect_to posts_path
 end

  private

    def post_params
      params.require(:post).permit(:title, :description)
    end
end
