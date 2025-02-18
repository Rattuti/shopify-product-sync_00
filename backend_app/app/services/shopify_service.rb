require 'shopify_api'

class ShopifyService
    SHOP_NAME = ENV['SHOPIFY_STORE_NAME']
    ACCESS_TOKEN = ENV['SHOPIFY_ACCESS_TOKEN']

    def self.get_products
        session = ShopifyAPI::Auth::Session.new(shop: "#{SHOP_NAME}.myshopify.com", access_token: ACCESS_TOKEN)
        client = ShopifyAPI::Clients::Rest::Admin.new(session: session)

        response = client.get(path: "products.json")
        response.body["products"]
    end
end
