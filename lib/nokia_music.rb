require 'faraday_middleware'
require "nokia_music/version"
require 'nokia_music/configuration'
require 'nokia_music/client'

module NokiaMusic
  extend Configuration
  
  mattr_accessor :client_id

  # Alias for NokiaMusic::Client.new
  #
  # @return [NokiaMusic::Client]
  def self.client(options={})
    NokiaMusic::Client.new(options)
  end

  # Alias for NokiaMusic::Client.new
  #
  # @return [NokiaMusic::Client]
  def self.new(options={})
    NokiaMusic::Client.new(options)
  end

  # Delegate to NokiaMusic::Client
  def self.method_missing(method, *args, &block)
    return super unless new.respond_to?(method)
    new.send(method, *args, &block)
  end

  def self.respond_to?(method, include_private = false)
    new.respond_to?(method, include_private) || super(method, include_private)
  end
end
