class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "Hi #{ current_user.username }. Hope you will have a good time here."
			redirect_to articles_path


		else
			flash.now[:danger] = "Oops! seems you forgot your password"
			render 'new'
		end

	end
	def destroy
		session[:user_id] = nil
		flash[:success] = "Logged out! Come back soon! "
		redirect_to root_path
	end
end