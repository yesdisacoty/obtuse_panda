class ProjectsController < ApplicationController
    before_filter :find_params, only: [:create, :update, :show, :delete]
    
    def index
       @projects = Project.all 
    end
    
    def create
        @project = Project.new(project_params)
    end
    
    def update
    end
    
    def delete
        @project.destroy
        
        redirect_to projects_path
    end
    
    def new
    end
    
    def show 
    end
        
    def edit
        if @project.update(params[:project].permit(:title, :description))
            redirect_to @project
        else
            render 'edit'
        end
    end
    
    def find_params
        @project = Project.find(params[:id])
    end
    
    private
    def project_params
       params.require(:project).permit(:title, :description) 
    end
    
    
end
