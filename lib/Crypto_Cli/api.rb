# frozen_string_literal: true

require 'pry'
class Crypto::Ticker
  puts '⛓Api Loaded ⛓'
  @@data = []

  def get_ticker
    get_ticker
  end

  KEY = ENV['API_KEY']
  BASE_URL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{KEY}&limit=15&cryptocurrency_type=all"

  def get_ticker
    response = RestClient.get(BASE_URL)
    json = Crack::JSON.parse(response)
    puts json
    json.each do |k|
      @@data << k
    end
  end
  # binding.pry

  def data
    @@data
  end
end
