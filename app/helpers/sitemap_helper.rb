module SitemapHelper
  def record_images(record, include_main_image: true, include_gallery: false)
    imgs = []
    imgs << record.main_image.url if include_main_image
    
    if include_gallery
      record.gal.gal_images.each do |i|
        imgs << i.src.url
      end
    end  
    
    h_arr = []
    imgs.flatten.each do |i|
      h_arr << {:loc => i}
    end
    h_arr
  end
end

# SitemapGenerator::Interpreter.send :include, SitemapHelper