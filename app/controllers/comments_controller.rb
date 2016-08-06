class CommentsController < ApplicationController
#	 before_action :authorize

  def create 
  	@comment = Comment.new(comment_params)
  	@comment.user_id = current_user.id
  	@comment.save
    @comments = Comment.where("post_id = ?", params[:post_id]).order(created_at: :asc)
      
    respond_to do |format|
      format.js
      #format.html
    end
  end

   def destroy
    @comment = Comment.find(params[:id])
    if current_user.role == 'admin'
      @comment.destroy
    elsif @comment.user_id == current_user.id
      @comment.destroy
    end
    redirect_to :back
    flash[:success] = "Comment deleted"

  end

  private
    def comment_params
      params.permit(:content, :post_id)
    end
end

