module ListsHelper
    def counter_tasks(id)
        Task.where(list_id: id).length
    end 

    def agroup_category(lists)
        lists.group_by { |item| item[:category]}
    end
end
