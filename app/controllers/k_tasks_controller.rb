class KTasksController < ApplicationController
  before_action :set_k_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @k_tasks = KTask.all.page(params[:page]).per(3)
  end
  
  def show
  end
  
  def new
    @k_task = KTask.new
  end
  
  def create
    @k_task = KTask.new(k_task_params)
  
    if @k_task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @k_task
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @k_task.update(k_task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @k_task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @k_task.destroy
    flash[:success] = 'Task は削除されました'
    redirect_to k_tasks_url
  end
  
  private
  
  def set_k_task
    @k_task = KTask.find(params[:id])
  end
  
  def k_task_params
    params.require(:k_task).permit(:content, :status)
  end
  
end
