module SocialNetworkingHelper
  def social_networking_row(site_name, fb_layout: 'button', twitter_count: 'none', include_twitter_script: false)
    render :partial => 'utilities/share_buttons', locals: {:site_name => site_name, :fb_layout => fb_layout, :twitter_count => twitter_count,
                                                           :include_twitter_script => include_twitter_script}
  end
end