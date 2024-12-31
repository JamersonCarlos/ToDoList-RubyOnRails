class TasksController < ApplicationController
    before_action :set_list, only:  %i[show_tasks]

    def show_tasks 
        @tasks = Task.where(list_id: @list.id)
    end

    def new 
        @task = Task.new 
    end

    def create
        @task = Task.new(title: params[:title], term: params[:term], list_id: params[:id])
        if Task.where(title: @task.title) == []
            if @task.save
                flash[:notice] = "Task was successfully created."
            else
                flash[:error] = "Title cannot be empty"                
            end
        else 
            flash[:error] = "There is already a task with that title" 
        end 
        redirect_to request.referrer
    end

    def destroy
        @task = Task.find(params[:id])
        if @task.destroy!
            flash[:notice] = "Task was successfully destroyed."
        else
            flash[:error] = "Error when deleting task"
        end
        redirect_to request.referrer
    end

    def update 
        @task = Task.find(params[:id])
        
        if params[:task] != "" && params[:task].present? && params[:task][:title].present?
            @task.update(title: params[:task][:title])
            flash[:notice] = "Task updated successfully"
        else 
            flash[:error] = "Title cannot be empty"
        end

        redirect_to request.referrer
    end
        
    private 
        def set_list 
            @list = List.find(params[:id])
        end
        
   
end
