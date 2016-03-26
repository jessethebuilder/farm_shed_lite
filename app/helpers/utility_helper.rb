module UtilityHelper
  def middle_sorted_for_cols(arr)
    # sorts arrays with possible nils to center the data. Only works with an odd number of columns
    # a = arr
    # puts (arr.inspect)

    
    if arr[2].nil? 
      a = [arr[0], nil, arr[1]]

      if arr[1] == nil
        a = [nil, arr[0], nil]
        puts a.inspect
      end 
    end
    
    a
  end
  
  #--- Time/Date stuff ---   
  def machine_date(datetime)
    datetime.strftime('%Y-%m-%d')
  end
  
  def wordy_date(datetime)
    datetime.strftime('%B %e, %Y')
  end
  
  def machine_time(datetime)
    datetime.strftime('%Y-%m-%d')
  end
  
  def wordy_time(datetime)
    datetime.strftime('%H:%M')
  end
end