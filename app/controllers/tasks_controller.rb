class TasksController < ApplicationController
    before_action :set_list, only:  %i[index]
    before_action :set_task, only: %i[destroy]

    def index
        @task = Task.new
        @tasks = Task.where(list_id: @list.id)
    end

    def create
        @task = Task.new(list_params)
        @task.list_id = params[:list_id]
        if Task.where(title: @task.title) == []
            @task.save
        end 
        redirect_to request.referrer
    end

    def destroy
        @task.destroy
        redirect_to request.referrer
    end

    def update 
        @task = Task.where(id: params[:id].present? ? params[:id] : params[:task_id]) 
        if params[:task].present? && params[:task][:title].present?
            @task.update(title: params[:task][:title])
        else 
            @task.update(completed: params[:completed])
            @task.update(done_at: Time.current)
        end
        redirect_to request.referrer
    end
        
    private 
        def set_list 
            @list = List.where(id: params[:list_id])[0]
        end

        def set_task
            @task = Task.find_by(id: params[:task_id])
        end

        def list_params 
            params.require(:task).permit(:title)
        end
        
   
end
