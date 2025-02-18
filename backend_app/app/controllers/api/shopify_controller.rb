class Api::ShopifyController < ApplicationController
    def products
        products = ShopifyService.get_products
        render json: products
    end
end
