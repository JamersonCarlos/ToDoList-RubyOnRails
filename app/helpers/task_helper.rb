require 'date'
module TaskHelper
    def filter_completed(tasks)
        tasks.filter { |task| task.completed }
    end 

    def filter_not_completed(tasks)
        tasks.filter { |task| task.completed == false}
    end

    def filter_tasks_today(tasks) 
        tasks.filter{|task| verify_status_term(task.term) == 2}
    end

    def filter_tasks_overdue(tasks) 
        tasks.filter{|task| verify_status_term(task.term) == 1}
    end
  

    def transform_format_date(data)
        datetime = DateTime.parse(data.to_s) 
        datetime.strftime('%d/%m/%Y - %H:%M')
    end
    
    def verify_status_term(data) 
        return 0 if data.nil? # Retorna falso se data for nil
        
        if data.to_date < Date.today
            1            
        elsif data.to_date == Date.today     
            2
        end
        
    end
    
end
