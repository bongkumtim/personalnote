class NotesController < ApplicationController
	before_action :find, only: [:show, :edit, :update, :destroy]


	def index
		@notes =  Note.where(user_id: current_user)
	end

	def show
	end

	def new
		@note = current_user.notes.build
	end

	def create
		@note = current_user.notes.build(note_params)

		if @note.save
			redirect_to @note
		else 
			render 'new'
		end
	end 

	def edit
	end

	def update
		if @note.update(note_params)
			redirect_to @note
		else
			render 'edit'
		end
	end

	def destroy
		if @note.destroy
			redirect_to @note
		end
	end

	private

	def find
		@note = Note.find(params[:id])
	end

	def note_params
		params.require(:note).permit(:title, :content)
	end
end
