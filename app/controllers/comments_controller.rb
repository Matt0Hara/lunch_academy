class CommentsController < ApplicationController
  before_action :cube_authentication
  def create
    if request.xhr?
      @comment = Comment.new(body: params[:body],
                 meetup_id: params[:meetup_id])
      @comment.user = current_user
      if @comment.save
        respond_to do |format|
          format.html { render @comment }
        end
      else
        flash[:errors] = "Error!"
        redirect_to meetups_path
      end
    else
      @comment = Comment.new(body: comment_body[:body],
                 meetup_id: params[:meetup_id])
      @comment.user = current_user
      if @comment.save
        redirect_to meetups_path
      else
        redirect_to :back
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    commentId = @comment.id
    if @comment.destroy
      respond_to do |format|
        format.html { render json: commentId }
      end
    end
  end

  private

  def comment_body
    # change new to :meetup
    params.require(:comment).permit(:body)
  end
end
