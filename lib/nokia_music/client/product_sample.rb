module NokiaMusic
  module ProductSample

    def product_sample(product_id)
      request = construct_request("products/#{product_id}/sample")
      Hashie::Mash.new(product_id: product_id, url: "#{request[:url]}?#{request[:params].to_query}")
    end
    
  end
end