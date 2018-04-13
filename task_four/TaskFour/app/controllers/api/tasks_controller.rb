# frozen_string_literal: true

module Api
  class TasksController < ApplicationController
    before_action :set_task, only: %i[show update destroy]
    before_action :authenticate_user, only: %i[destroy update]
    # GET /tasks
    def index
      @tasks = Task.all

      render json: (json_list @tasks)
    end

    # GET /tasks/1
    def show
      render json: (json_list @task)
    end

    # POST /tasks
    def create
      @task = Task.new

      if @task.save
        render json: (json_list @task), status: :created
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /tasks/1
    def update
      if @task.update(task_params)
        render json: @task.check_answer.to_json
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end

    # DELETE /tasks/1
    def destroy
      @task.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:encode)
    end

    def json_list(var)
      { tasks: var.as_json(only: %i[digest _id status]) }
    end
  end
end
