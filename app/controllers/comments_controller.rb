class CommentsController < ApplicationController
  http_basic_authenticate_with name: "sumit", password: "daksh", only: :destroy
  def create
    @articale = Articale.find(params[:articale_id])
    @comment = @articale.comments.create(comment_params)
    redirect_to articale_path(@articale)
  end
  def destroy
    @articale = Articale.find(params[:articale_id])
    @comment =@articale.comments.find(params[:id])
    @comment.destroy
    redirect_to articale_path(@articale)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)

  end
end
