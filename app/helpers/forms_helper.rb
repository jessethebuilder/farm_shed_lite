module FormsHelper
  def update_select_from_modal(obj, select_selector, modal_selector: '#express_modal', val_method: :id, text_method: :name)
    render :partial => 'forms_helper/update_from_select', :locals => {:obj => obj, :modal_selector => modal_selector, 
                                                                      :select_selector => select_selector,
                                                                      :val_method => val_method, :text_method => text_method}
  end
end      