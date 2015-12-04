module SchemaDotOrgHelper
  # def sdo_date(date)
    # html = "<span itemprop="
  # end
  
  def machine_date(datetime)
    datetime.strftime('%Y-%m-%d')
  end
  
  def wordy_date(datetime)
    datetime.strftime('%B %e, %Y')
  end
end