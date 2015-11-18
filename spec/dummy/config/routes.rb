Rails.application.routes.draw do
  get 'fb_login', to: 'sandboxes#fb_login', as: 'fb_login'
  root 'sandboxes#fb_login'
end
