class CommentsController < ApplicationController

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
	end

	def new
    @comment = Comment.new
		@author = Author.all
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    # if @author.save
    #   redirect_to authors_path, notice: 'Author Created'
    # else
    #   render :new
    # end
  end

	private

	def comment_params
		params.require(:comment).permit(:content, :author_id, :post_id)
	end

end
