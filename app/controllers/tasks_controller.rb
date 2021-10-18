class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /tasks or /tasks.json
  def index
    @tasks = current_user.tasks.all.page(params[:page]).per(5)
    @q = @tasks.ransack(params[:q])
    @tasks = @q.result.includes(:user).page(params[:page]).order("deadline_on asc")
    @tasks = @tasks.order("deadline_on asc") if params[:sort_limit]
    @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @comments = @task.comments
    @comment = @task.comments.build
    unless @task.user_id == current_user.id
      redirect_to tasks_path, notice: '他の人のページへアクセスは出来ません'
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    unless @task.user_id == current_user.id
      redirect_to tasks_path, notice: '他の人のページへアクセスは出来ません'
    end
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
    @task.plan_hours += params[:plan_hours].to_f
    @task.spend_hours += params[:spend_hours].to_f
    if @task.save
      redirect_to tasks_path, notice: "タスクが登録されました"
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    # @task.plan_hours += params[:plan_hours].to_f
    # @task.spend_hours += params[:spend_hours].to_f
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクが更新されました"
    else
      render :edit
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "タスクが削除されました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:assortment, :major_category, :medium_category, :sub_category, :content, :plan_hours, :spend_hours, :deadline_on, :status, { label_ids: [] })
    end
end