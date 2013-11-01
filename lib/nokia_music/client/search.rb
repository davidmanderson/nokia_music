module NokiaMusic
  module Search

    def search(query, category, options={})
      params = {q: query, category: category}
      params.merge!(options)

      # clear empty key/value pairs
      params.reject! { |key, value| value.nil? }

      request('', params)
    end

  end
end