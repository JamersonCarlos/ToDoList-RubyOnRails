module ApplicationHelper
    
    def filter_completed(tasks)
        tasks.filter { |task| task.completed }
    end 

    def filter_not_completed(tasks)
        tasks.filter { |task| task.completed == false}
    end

    def counter_tasks(id)
        Task.where(list_id: id).length
    end 

    def agroup_category(lists)
        lists.group_by { |item| item[:category]}
    end
        
end
