class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "Sucessfully logged in"
			redirect_to users_path(user)


		else
			flash.now[:danger] = "There was something wrong with the information you provided!"
			render 'new'
		end

	end
	def destroy
	end
end