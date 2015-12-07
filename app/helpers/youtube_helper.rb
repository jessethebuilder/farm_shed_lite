module YoutubeHelper
    def embedded_video_from_watch(watch_url, width: '100%', frameborder: 0)
    slug = watch_url.split('watch?v=')[1]
    %Q|<iframe width="#{width}" src="https://www.youtube.com/embed/#{slug}" frameborder="#{frameborder.to_s}" allowfullscreen></iframe>|.html_safe
  end
end