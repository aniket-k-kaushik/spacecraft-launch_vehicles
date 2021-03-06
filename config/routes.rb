# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :spacecrafts, only: [:index, :show, :create, :update, :destroy]
      resources :launch_vehicles, only: [:index, :show, :create, :update, :destroy]
      resources :launches, only: [:index, :show, :create, :update, :destroy]
    end 
  end
end
