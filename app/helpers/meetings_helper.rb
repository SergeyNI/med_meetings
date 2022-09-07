module MeetingsHelper
  def button_class(status)
    
    
    if params['status'].nil?
      
      if params['status'] === status
        class_name = 'btn-primary'
      else
        class_name = 'btn-outline-primary'
      end
    else
      
      if params['status'].to_i === status
        class_name = 'btn-primary'
      else
        class_name = 'btn-outline-primary'
      end
    end
    
  end
end
