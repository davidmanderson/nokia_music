require 'faraday'
require File.expand_path('../version', __FILE__)

module NokiaMusic
  # Defines constants and methods related to configuration
  module Configuration

    # An array of valid keys in the options hash when configuring
    VALID_OPTIONS_KEYS = [:adapter, :endpoint, :itemsperpage, :user_agent, :request_options].freeze

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER = Faraday.default_adapter

    # The endpoint that will be used to connect if none is set
    DEFAULT_ENDPOINT = 'http://api.ent.nokia.com/1.x'.freeze

    # The country code that will be used if none is set
    DEFAULT_COUNTRY_CODE = 'us'.freeze
    
    # The domain that sill be used if none is set
    DEFAULT_DOMAIN = 'music'.freeze

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "Nokia Music Ruby Gem #{NokiaMusic::VERSION}".freeze

    # The default number of results to return from the API
    DEFAULT_ITEMSPERPAGE = nil

    # The default request options for Faraday
    DEFAULT_REQUEST_OPTIONS = {
      :timeout => 5,
      :open_timeout => 5
    }

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter          = DEFAULT_ADAPTER
      self.endpoint         = DEFAULT_ENDPOINT
      self.user_agent       = DEFAULT_USER_AGENT
      self.request_options  = DEFAULT_REQUEST_OPTIONS
      self.itemsperpage     = DEFAULT_ITEMSPERPAGE
    end
  end
end