class TasksController < ApplicationController
  def index
    @user = current_user.id
    @tasks = Task.all.order(created_at: :desc)
  end
  def new
    @user = current_user.id
    @task = Task.new
  end
  
  def create
    @user = current_user.id
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url 
    else
      flash[:alert] = "新規投稿に失敗しました。"
      render :new
    end
  end
  def edit 
    @task = Task.find(params[:id])
    @user = current_user.id
  end
  
  def show
  end
  
  def update
    @user = User.find(params[:user_id])
    @task = task.find(params[:id])
    if @task.update.attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url(@use,@task)
    else
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @user = current_user.id
    @task.destroy
    flash[:success] = "@task.nameのデータを削除しました。"
    redirect_to tasks_url(@user,@tasks)
  end
  
  private
   def task_params
     params.require(:task).permit(:task.name, :task_details, :user_id)
   end
end
 
