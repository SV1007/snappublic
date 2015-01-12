class CommentsController < ApplicationController
	def new
		@photo = Photo.find_by(id: params[:id])
		@comment = @photo.comments.new
	end

	def create
		@photo = Photo.find_by(id: params[:id])
		@comment = @photo.comments.new(comment_params)
		if @comment.save
			redirect_to action: "show", id: @photo.id, controller: "photos"
		end
	end

		private

			def comment_params
				params.require(:comment).permit(:text)
			end
end