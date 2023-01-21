class BugsController < ApplicationController
    load_and_authorize_resource
    before_action :set_project , only: %i[ index show new create edit update destroy]
    before_action :set_bug, only: %i[ show edit update destroy ]
    def index
          if  can? :manage , Bug
              @bugs = @project.bugs   
        else
            @bugs = Bug.where(dev_id: current_user.id) 
        end

    end
    def show
    end
    def new
        @bug = @project.bugs.new
    end
    def create 
        @bug = @project.bugs.new(bug_params)
    
        if @bug.save
            redirect_to project_bugs_path , notice => "Your Post create successfully"
        else
            render "new"
        end

    end


    def edit
    end


    def update
            if @bug.update(bug_params)
                redirect_to [@project, @bug]
            else
                render "new"
            end
    end


    def destroy
        @bug.destroy
       respond_to do |format|
      format.html { redirect_to [@project, :bugs], notice: "Bug was successfully destroyed." }
       end
    end

    def assignUserToBug 
        p_id = params[:id].to_i
        b_id = params[:bid].to_i
        u_id = params[:uid].to_i
        @bug = Bug.find(b_id)
        if @bug.developer.blank?
            @bug.update(dev_id: u_id )
        elsif (!@bug.developer.blank? and @bug.developer.id != u_id )
            @bug.update(dev_id: nil )
             @bug.update(dev_id: u_id )
        else            
            @bug.update(dev_id: nil )
        end
        redirect_to project_bug_path(p_id , b_id)
    end



private
    def set_project
      @project = Project.find(params[:project_id])
    end
    def set_bug
      @bug = @project.bugs.find(params[:id])
    end
    def bug_params
    params.require(:bug).permit(:title , :deadline , :status , :description , :bug_type , :project_id , :user_id , :dev_id , :image).merge(user_id: current_user.id)  
      
    end
end
