class TasksController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :destroy]

#get 'tasks', to: 'tasks#index'
  def index
    @tasks = Task.all
  end
#  get 'tasks/:id', to: 'tasks#show', as: :task
  def show
  end
# get 'tasks/new', to: 'tasks#new', as: :new
  def new
    @task = Task.new
  end

# Routed to from ==> post 'tasks', to: 'tasks#create'
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

# get 'tasks/:id/edit', to: 'tasks#edit', as: :edit
  def edit
  end

# patch 'tasks/:id', to: 'tasks#update'
  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end
  
#delete 'tasks/:id', to: 'tasks#destroy'
  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private 

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :details, :completed)
  end
end
