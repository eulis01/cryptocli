# frozen_string_literal: true

require 'pry'
class Crypto::Api
  puts '⛓Api Loaded ⛓'
  @@data = nil

  def initialize
    get_ticker
  end

  KEY = ENV['API_KEY']
  URL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{KEY}&limit=15&cryptocurrency_type=all"

  def get_ticker
    data = URL
    uri = URI(data)
    response = Net::HTTP.get(uri)
    # response = RestClient.get(URL)
    @@data = JSON.parse(response)

    # binding.pry
  end

  def data
    @@data
  end
end
# binding.pry
