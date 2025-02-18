Rails.application.routes.draw do
  namespace :api do
    get 'shopify/products', to: 'shopify#products'
  end
end
