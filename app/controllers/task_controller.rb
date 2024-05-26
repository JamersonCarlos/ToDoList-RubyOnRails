class TaskController < ApplicationController
    before_action :set_list, only:  %i[show_tasks create]

    def show_tasks 
        @tasks = Task.where(list_id: @list.id)
    end

    def new 
        @task = Task.new 
    end

    def create
        @task = Task.new(title: params[:title], list_id: params[:id])
        if @task.save
            redirect_to request.referrer
        end 
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to request.referrer
    end

    def update 
        @task = Task.find(params[:id])
        @task.update(completed: params[:completed] == "true")
        redirect_to request.referrer
    end
        
    private 
        def set_list 
            @list = List.find(params[:id])
        end
        
   
end
