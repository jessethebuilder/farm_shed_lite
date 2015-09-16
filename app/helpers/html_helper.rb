module HtmlHelper
  def image_select(form_builder, image_attr, preview_version: :thumb, label: image_attr.to_s.titlecase, multiple: false, accepts_remote_url: true)
    render :partial => 'utilities/image_select.html.erb', :locals => {:f => form_builder,
                                                          :image_attr => image_attr, :preview_version => preview_version,
                                                          :multiple => multiple, :accepts_remote => accepts_remote_url,
                                                          :label => label}
  end
  
  #------------- Quick Options -------------------
  
  def quick_options(*options, ajax: false)
    html = initiate_quick_options
    html += '<ul class="quick_options">'

    options << yield if block_given?
    options.each do |o|
      html += '<li>'
      html += link_to o[0], o[1], remote: ajax
      html += '</li>'
    end
    html += '</ul>'
    #html += '</div>'

    html.html_safe
  end
  
  def initiate_quick_options
    
    "<script>$(document).ready(function(){
        toggleClassOnHover('.quick_options li', 'quick_option_selected');
      })</script>"
  end
  
  #------------ For Select tools -----------------------
  def for_select(collection, id_method, value_method, selected_ids: nil)
    options = collection.each.collect{ |item| [item.send(id_method), item.send(value_method)] }
    if selected_ids
      options_for_select(options, selected_ids)
    else
      options_for_select(options)
    end
  end

end