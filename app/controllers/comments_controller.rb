class CommentsController < ApplicationController
  before_action :cube_authentication
  def create
    @comment = Comment.new(body:comment_body[:body], meetup_id: params[:meetup_id])
    @comment.user = current_user
    if @comment.save
      redirect_to meetups_path
    else
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to meetups_path
  end

  private

  def comment_body
    # change new to :meetup
    params.require(:comment).permit(:body)
  end
end
