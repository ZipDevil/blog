Rails.application.routes.draw do

  resources :customers
  resources :posts do
    resources :comments
    # get    '/comments',          to: 'comments#index', as: 'comments'
    # post   '/comments',          to: 'comments#create'
    # get    '/comments/new',      to: 'comments#new',   as: 'new_comments'
    # get    '/comments/:id',      to: 'comments#show',  as: 'post_comment'
    # get    '/comments/:id/edit', to: 'comments#edit',  as: 'edit_comments'
    # patch  '/comments/:id',      to: 'comments#update'
    # delete '/comments/:id',      to: 'comments#destroy'
  end
  resources :orders
  resources :pages

end
