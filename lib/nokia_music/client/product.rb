module NokiaMusic
  module Product
    
    ARTIST  = "artist"
    ALBUM   = "album"
    SINGLE  = "single"
    TRACK   = "track"

    def product(id, options={})
      params = {}
      params.merge!(options)

      # clear empty key/value pairs
      params.reject! { |key, value| value.nil? }

      request("products/#{id}", params)
    end
    
  end
end