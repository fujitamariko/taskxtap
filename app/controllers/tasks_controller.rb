class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /tasks or /tasks.json
  def index
    @tasks = current_user.tasks.all.page(params[:page]).per(5)
    @q = @tasks.ransack(params[:q])
    @tasks = @q.result.includes(:user).page(params[:page]).order("deadline_on asc").per(5)
    @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @comments = @task.comments
    @comment = @task.comments.build
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクが登録されました"
    else
      render :new
    end
end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "タスクが更新されました" }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
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