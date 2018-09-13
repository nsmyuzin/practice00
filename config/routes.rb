Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  ##ROOT
  root to: 'home#index'
  ##Blog
  namespace :blog do
    resources :articles, only:[:index,:show], constraints: {id: /[0-9]{1,10}/}
    ## collection do
    ## end
    ## member do
    ## post :update_text_memo , { format: 'js' }
    ## end
  end
end
