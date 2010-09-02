class UserController < ApplicationController

	def create
		sender = User.find_or_create_by_email(:email => params[:email], :name => params[:name])
	end
end
