class AdminUsersController < ApplicationController
	layout 'admin'
	before_filter :confirm_logged_in
	def index
		list
		render('list')
	end
	def list
		@admin_users = AdminUser.sorted
	end
	
	def new
		@admin_users = AdminUser.new
	end
	def create
		#instantiate the subject with form parameters
		@admin_user = AdminUser.new(params[:admin_user])
		#Save the object
		@admin_user.save
		#If save succeeds redirect to the list action
		if @admin_user.save
			flash[:notice] = "Admin user created."
			redirect_to(:action => 'list')
		else
		#If save fails, redisplay the form so that the user can fix problems 
			render('new')
		end
	end
	def edit
		@admin_user = AdminUser.find(params[:id])
	end
	def update
		#Find the subject with form parameters
		@admin_user = AdminUser.find(params[:id])
		#Update the object
		@admin_user.update_attributes(params[:admin_user])
		#If update succeeds redirect to the list action
		if @admin_user.update_attributes(params[:admin_user])
			flash[:notice] = "Admin user updated."
			redirect_to(:action => 'list')
		else
		#If update fails, redisplay the form so that the user can fix problems 
			render('edit')
		end
	end
	def delete
		@admin_user = AdminUser.find(params[:id])
	end
	def destroy
		# subject find it and destroy it
		AdminUser.find(params[:id]).destroy
		flash[:notice] = "Admin user destroyed."
		redirect_to(:action => 'list')
	end

end
