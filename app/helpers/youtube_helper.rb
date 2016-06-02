module YoutubeHelper
  def extract_id_from_watch(url)
    url.split('watch?v=')[1]
  end  
  
  def embedded_video_from_watch(watch_url, width: '100%', frameborder: 0)
    slug = extract_id_from_watch(watch_url) 
    %Q|<iframe width="#{width}" src="https://www.youtube.com/embed/#{slug}" frameborder="#{frameborder.to_s}" allowfullscreen></iframe>|.html_safe
  end
  
  def preview_image_from_watch(watch_url)
    slug = extract_id_from_watch(watch_url)
    "http://img.youtube.com/vi/#{slug}/0.jpg"
  end
  
end