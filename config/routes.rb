Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  begin
    ActiveAdmin.routes(self)
  rescue Exception => e
    puts "ActiveAdmin: #{e.class}: #{e}"
  end
  ##ROOT
  root to: 'home#index'

  resources :contacts, only:[:new,:create] do
    collection do
      post :confirm , {format: 'html'}
    end
  end

  ##Blog
  scope module: :blog do
    ##resources :articles, only:[:index,:show], constraints: {id: /[0-9]{1,10}/}
    get '/:c_url', to: 'articles#index', as: 'articles'
    get '/:c_url/:id', to: 'articles#show', as: 'article', constraints: {id: /[0-9]{1,10}/}
    ##categories
    resources :categories, only:[:show], constraints: {id: /[0-9]{1,10}/}
      ## collection do
      ## end
      ## member do
      ## post :update_text_memo , { format: 'js' }
      ## end
  end
end
