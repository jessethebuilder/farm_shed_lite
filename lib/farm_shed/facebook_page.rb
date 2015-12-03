module FacebookHelper
  include RestHelper
  BASE = 'https://graph.facebook.com/v2.5/'

  class FacebookPage
    def initialize(id, secret, page)
      @id = id  
      @secret = secret
      @page = page
      @token = "#{@id}|#{@secret}"
    end  
     
    def publish(link: nil, message: nil)
      RestClient.log = 'stdout'
      raise ArgumentError, ':link AND :message cannot be nil' if link.nil? && message.nil?
      url = "#{BASE}#{@page}/feed"
      res = url_to_json(url, :method => :post, :params => {:message => message, :link => link, :authorization => @token})
    end  
    
    def feed
      res = url_to_json("#{BASE}#{@page}/feed?access_token=#{@token}")
    end
    
    def access_token
      url_to_json("oauth/access_token?client_id=#{@id}&client_secret=#{@secret}&grant_type=client_credentials")['access_token']
    end
    
    def FacebookPage.temp
      self.new('1405477876366613', 'bf5306d4d7b7fe4346815f81475acc3c', 'AnysoftSoftwareCompany')
    end
    # 1405477876366613|bf5306d4d7b7fe4346815f81475acc3c
  end # end class FacebookPage
end