# frozen_string_literal: false
# Bugs_controller
class BugsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_bug, only: %i[create show edit update destroy]

  def index
    @bugs = @project.bugs
  end

  def show
  end

  def new
    @bug = @project.bugs.build
  end

  def create
    @bug = @project.bugs.build(bug_params)
    if @bug.save
      redirect_to(@bug.project)
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @bug.update(bug_params)
      redirect_to([@bug.project, @bug], notice: 'Bugtitle was successfully updated.')
    else
      render :edit
    end
  end

  def destroy
    @bug.destroy
    redirect_to @project
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def set_bug
    @bug = @project.bugs.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :deadline, :type, :status, :project_id)
  end
end
