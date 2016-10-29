class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	def index
		@projects = Project.all
		# @products = Project.where(category: "Product")
		# @collaborations = Project.where(category: "Collaboration")
		# @consultings = Project.where(category: "Consulting")
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.user = current_user
		if @project.save
			redirect_to @project
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @project.update(project_params)
			redirect_to @project
		else
			render :edit
		end
	end

	def show
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end

	private
	def project_params
		params.require(:project).permit(:name, :text, :price, :user_id)
	end

	def set_project
		@project = Project.find(params[:id])
	end
end
