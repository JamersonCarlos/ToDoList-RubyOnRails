class TaskController < ApplicationController
    before_action :set_list, only:  %i[show_tasks]

    def show_tasks 
        @tasks = Task.where(list_id: @list.id)
    end

    def new 
        @task = Task.new 
    end

    def create
        @task = Task.new(title: params[:title], list_id: params[:id])
        if Task.where(title: @task.title) == []
            @task.save
        end 
        redirect_to request.referrer
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to request.referrer
    end

    def update 
        @task = Task.find(params[:id])
        
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
            @list = List.find(params[:id])
        end
        
   
end
