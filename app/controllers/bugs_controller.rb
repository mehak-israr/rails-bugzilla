class BugsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_project
  before_action :set_bug, only: [:show, :edit, :update, :destroy]

  def index
   @bugs = @project.bugs
  end

   def show
    @bug=Bug.find(params[:project_id])
  end

   def new
    @bug=@project.bugs.build
  end

  def create
    @bug=project.bugs.build(bug_params)
    if @bug.save
      redirect_to project_bugs_path(@project)
    else
      render :new
    end
  end

  def edit
    @bug=Bug.find(params[:id])
  end

  def update
    @bug=Bug.find(params[:id])
    if @bug.update(bug_params)
      redirect_to project_bug_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @bug=Bug.find(params[:id])
    @bug.destroy
    redirect_to shark_bugs_path(@project)
  end

  private
  def bug_params
    params.require(:bug).permit(:title, :description, :type, :status)
  end

  private
  def get_project
    @project=Project.find(params[:project_id])
  end

private
  def set_bug
    @bug = @project.bugs.find(params[:id])
  end
end
