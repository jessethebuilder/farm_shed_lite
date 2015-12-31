Rails.application.routes.draw do
  get 'fb_login', to: 'sandboxes#fb_login', as: 'fb_login'
  
  get 'fb_push', to: 'sandboxes#fb_push', as: 'fb_push'
  root 'sandboxes#fb_push'
end
