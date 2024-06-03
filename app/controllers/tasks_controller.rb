class TasksController < ApplicationController
    before_action :set_list, only:  %i[index create]
    before_action :set_task, only: %i[destroy update]

    def index
        @task = Task.new
        @tasks = @list.tasks
    end

    def create
        if list_params[:title].present? 
            @task = Task.new(list_params)
            @task.list = @list
            respond_to do |format|
                result = Task.where(title: @task.title)
                if result == [] && @task.save
                    format.html { redirect_to request.referrer}
                else 
                    format.html { redirect_to request.referrer, notice: "A task with the same name already exists!", error: true}
                end 
            end
        else 
            respond_to do |format|
                format.html { redirect_to request.referrer, notice: "Does not accept Task with empty title", error: true }
            end
        end
    end

    def destroy
        @task.destroy
        redirect_to request.referrer
    end

    def update 
        respond_to do |format|
            if params[:task].present? && params[:task][:title].present?
                if Task.where(title: params[:task][:title]) == [] 
                    @task.update(title: params[:task][:title])
                    format.html { redirect_to request.referrer}
                else 
                    format.html { redirect_to request.referrer, notice: "A task with the same name already exists!"}
                end 
            elsif params[:completed].present?
                @task.update(completed: params[:completed])
                @task.update(done_at: Time.current)
                format.html { redirect_to request.referrer}
            else 
                format.html { redirect_to request.referrer, notice: "Does not accept Task with empty title" }
            end
        end
       
    end
        
    private 
        def set_list 
            @list = List.find_by(id: params[:list_id])
        end

        def set_task
            @task = Task.find_by(id: params[:task_id].present? ? params[:task_id] : params[:id])
        end

        def list_params 
            params.require(:task).permit(:title)
        end
        
   
end
