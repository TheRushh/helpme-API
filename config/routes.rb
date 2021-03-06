Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  use_doorkeeper do
  skip_controllers :authorizations, :applications,
    :authorized_applications
  controllers tokens: 'auths'  
end

resource :places, only: [] do
  	resource :registered_places
    resource :nearby_places, only: [] do
      collection do
    		post 'fetch'
    		post 'connectable'
        post 'connect'
        post 'disconnect'
    	end
    end
  end

resources :registered_places do
  resource :visitors
end

# resources :visitors, as: :visits, path: "visits" do
  resource :posts
# end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
