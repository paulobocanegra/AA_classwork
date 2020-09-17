Rails.application.routes.draw do
    resources :users do
        resources :subs, only:[:edit, :create, :update] 
    end
    resource :session, only:[:create, :destroy, :new]
    resources :subs, except:[:destroy, :edit, :create, :update]
    resources :posts, only: [:edit, :update, :destroy, :create, :show]

end
# /subs/:moderator_id/edit
