# frozen_string_literal: true

require 'pry'
class Crypto::Api
  attr_accessor :data
  puts '⛓Api Loaded ⛓'
  @@data = []

  def get_ticker
    get_ticker
  end

  KEY = ENV['API_KEY']
  BASE_URL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{KEY}&limit=15&cryptocurrency_type=all"

  def get_ticker
    res = RestClient.get(BASE_URL)
    @@data = Crack::JSON.parse(res)

    # @@data.push(json)
    # puts json.to_s
    # json.each do |k|
    #  @@data << k
    # end
  end

  def data
    @@data
  end
  # binding.pry
end
