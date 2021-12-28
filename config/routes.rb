Rails.application.routes.draw do
  root 'welcome#index'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'

  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'

  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  get 'org_new', to: 'orgs_new#new'
  post 'org_new', to: 'orgs_new#create'

  get 'org_update', to: 'orgs_edit#edit'
  post 'org_update', to: 'orgs_edit#update'

  get 'org_join', to: 'orgs_join#edit'
  patch 'org_join', to: 'orgs_join#update'

  get 'shifts_modify', to: 'shifts_modify#new'
  post 'shifts_modify', to: 'shifts_modify#create'

  post 'leave_org', to: 'orgs_edit#leave'
  post 'delete_shift', to: 'shifts_modify#destroy'

  get 'shifts_add', to: 'shifts_add#new'
  post 'shifts_add', to: 'shifts_add#create'

end
