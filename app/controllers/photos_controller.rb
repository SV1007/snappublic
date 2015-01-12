class PhotosController < ApplicationController
	def new
		@photo = Photo.new
	end
	
	def index
		@photos = Photo.all
	end

	def show
		@photo = Photo.find(params[:id])
		@comments = @photo.comments.all
	end

	def create
		@photo = Photo.create(photo_params)
		redirect_to '/home'
	end
	#:picture => params[:photo][:picture], :caption => params[:photo][:caption]

	def delete 
		@photo = Photo.find(params[:id])
		@photo.comments.delete
		@photo.delete
		redirect_to '/home'
	end

	private

		def photo_params
			params.require(:photo).permit(:picture, :caption) 
		end
end
