module DateHelper
    extend self
    def parse(date)
        Date.strptime(date, '%d/%m/%Y')
    rescue
        nil
    end

    def can_add_days?(start_date, end_date, days)
        _date = start_date.dup.next_day(days)
        
        _date <= end_date
    end
      
    def repeat_weekly(start_date, end_date)
        _start_date = start_date.dup
        dates = Array.new
        dates.push(_start_date)
        while can_add_days?(_start_date, end_date, 7)
          _start_date = _start_date.next_day(7)
          dates.push(_start_date.dup)
        end
        dates
    end
      
    def repeat_quinzenally(start_date, end_date)
        _start_date = start_date.dup
        dates = Array.new
        dates.push(_start_date)
        while can_add_days?(_start_date, end_date, 15)
            _start_date = _start_date.next_day(15)
            dates.push(_start_date.dup)
        end
        dates
    end
    
    def repeat_monthly(start_date, end_date)
        _start_date = start_date.dup
        dates = Array.new
        dates.push(_start_date)
        while can_add_month?(_start_date, end_date)
            _start_date = _start_date.next_month(1)
            dates.push(_start_date.dup)
        end
        dates
    end
    
    def can_add_month?(start_date, end_date)
        _date = start_date.dup.next_month(1)
        return _date <= end_date
    end 
end