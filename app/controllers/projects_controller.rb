class ProjectsController < ApplicationController
    load_and_authorize_resource
    before_action :set_project, only: %i[ show edit update destroy]
    def index
        if can? :manage , Project
            @projects = Project.all
        else
            @projects = current_user.projects
        end
        can? :read , current_user
    end


    def show
        @user = current_user
        can? :read , current_user
    end


    def new
        @project = Project.new
    end


    def create
        @user = current_user
        @project = @user.projects.build(project_params)
        #@project = Project.new(project_params)
        if @project.save
            redirect_to projects_path , notice => "Your Post create successfully"
        else
            render "new"
        end
    end


    def edit
    end


    def update
        if @project.update_attributes(project_params)
          redirect_to projects_path , notice => "Your Post was Update"
        else
            render "edit"
        end
    end


    def destroy
        @project.destroy
        redirect_to projects_path , notice => "Your Post was Deleted"
    end


    def assignUserToProject
        p_id = params[:id]
        u_id = params[:uid]
        @user_projects = UserProject.find_by(user_id: u_id , project_id: p_id)
        if @user_projects.blank? 
            UserProject.create(user_id: u_id , project_id: p_id)
        else 
            @user_projects.destroy
        end
        redirect_to project_path
    end


private
    def set_project
      @project = Project.find(params[:id])
    end
    def project_params
      params.require(:project).permit(:name , :description)  
    end


end
