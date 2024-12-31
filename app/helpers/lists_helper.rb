module ListsHelper
    def counter_tasks(id)
        Task.where(list_id: id).length
    end 

    def agroup_category(lists)
        lists.group_by { |item| item[:category]}
    end

    def convert_format_date(date)  
        begin
            date.strftime("%d/%m/%Y")
        rescue => e 
            "-"
        end
    end
end
