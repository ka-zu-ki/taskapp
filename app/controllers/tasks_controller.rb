class TasksController < ApplicationController
  
  def index
    @task = Task.all
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params.merge!(user_id: current_user.id))
    if @task.save
      redirect_to board_path(board)
    else
      render :new
    end
  end

  def show
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :limit)
  end
end