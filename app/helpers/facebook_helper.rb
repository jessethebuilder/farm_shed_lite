require 'rest_helper.rb'

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
      # raise ArgumentError, ':link AND :message cannot be nil' if link.nil? && message.nil?
      url = "#{BASE}#{@page}/feed"
      res = url_to_json(url, :method => :post, :params => {'message' => message, :Authorization => "Bearer #{access_token}"})
    end  
    
    def feed
      res = url_to_json("#{BASE}#{@page}/feed?access_token=#{@token}")
    end
    
    def access_token
      url_to_json("#{BASE}oauth/access_token?client_id=#{@id}&client_secret=#{@secret}&grant_type=client_credentials")['access_token']
    end
    
    def FacebookPage.temp
      self.new('1405477876366613', 'bf5306d4d7b7fe4346815f81475acc3c', 'AnysoftSoftwareCompany')
    end
    
  end # end class FacebookPage

  
  def facebook_sdk(app_id, use_authentication: true)
    #this must be included to use any of these functions. Place just after opening <body> tag.
    #if use_authentication = true, you must include a facebookLoginStatusChangeCallback function in scope
    render :partial => 'facebook_helper/facebook_sdk', :locals => {:app_id => app_id, :use_authentication => use_authentication}
  end

  def follow_on_facebook_button(related, width: '225px', colorscheme: 'light', layout: 'standard', show_faces: true)
    #layouts are "standard", "box_count", "button_count", "button"
    content_tag :div, '', :class => 'fb-follow', :href => "http://www.facebook.com/#{related}",
                       'data-colorscheme' => colorscheme, 'data-layout' => layout, 'data-show-faces' => show_faces,
                       'data-width' => width
  end
  
  def like_on_fb(action: 'like', colorscheme: 'light', href: nil, layout: 'standard', share: false, show_faces: false, width: 450)
    content_tag :div, '', class: 'fb-like', data: {:action => action, :colorscheme => colorscheme, :href => href, :layout => layout, 
                                               :share => share, 'show-faces' => show_faces}
  end

  def like_on_facebook_button(url, width: 450, layout: 'button_count', action: 'like', show_faces: true, share: true)
    content_tag :div, '', :class => 'fb-like', 'data-href' => url, 'data-width' => width,
                       'data-layout' => layout, 'data-action' => action,
                       'data-show-faces' => show_faces, 'data-share' => share
  end

  def facebook_comments(href, width: '100%', numposts: 10, colorscheme: 'light')
    html = content_tag :div, '', :class => 'fb-comments', 'data-href' => href, 'data-width' => width,
                       'data-numposts' => numposts, 'data-colorscheme' => colorscheme
    html.html_safe
  end

  def facebook_meta_tags(title, description, image_url, resource_type, site_name, url = request.url, facebook_app_id: nil)
    html = %Q|<meta property="og:title" content="#{title}">|
    html += %Q|<meta property="og:url" content="#{url}">|
    html += %Q|<meta property="og:type" content="#{resource_type}">|
    html += %Q|<meta property="og:image" content="#{image_url}">|
    html += %Q|<meta property="og:site_name" content="#{site_name}">|
    html += %Q|<meta property="og:description" content="#{facebook_description(description)}">|
    html += %Q|<meta property="fb:app_id" content="#{facebook_app_id}">| if facebook_app_id
    html.html_safe
  end

  def facebook_description(str)
    #facebook doesn't like line breaks, so this prints out str until it hits the first <br> or <br /> -- /<br( \/)?>/
    index = /<br( \/)?>/ =~ str
    index ? str[0..(index - 1)] : str
  end
end

