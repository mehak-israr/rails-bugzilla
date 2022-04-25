class ProjectsController < ApplicationController
  before_action :authenticate_user!
  def index
   @projects = current_user.projects
  end

   def show
    @project=Project.find(params[:id])
  end

   def new
    @project=current_user.projects.build
  end

  def create
    @project=current_user.projects.build(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
    @project=Project.find(params[:id])
  end

  def update
    @project=Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @project=Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(:name,:description)
  end

end
