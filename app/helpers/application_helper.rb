module ApplicationHelper
    
    def filter_completed(tasks)
        tasks.filter { |task| task.completed }
    end 

    def filter_not_completed(tasks)
        tasks.filter { |task| task.completed == false}
    end
end
