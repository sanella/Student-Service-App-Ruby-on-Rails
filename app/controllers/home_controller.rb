class HomeController < ApplicationController
	def index
	end
	def about
	end
	def admin
		@professors = Professor.all
		@users = User.all
		@subjects = Subject.all
	end
end
