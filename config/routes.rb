Rails.application.routes.draw do
  root to: 'time_sheets#index'
  resources :time_sheets
  match "time_sheets/:id/clock_out", to: 'time_sheets#clock_out', as: "clock_out", via: :patch
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
