# frozen_string_literal: true

class Api
  attr_accessor :data
  def initialize
    @data = []
    get_ticker
  end

  KEY = ENV['API_KEY']
  URL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{KEY}&limit=15&cryptocurrency_type=all"

  def get_ticker
    data_url = URL
    uri = URI(data_url)
    response = Net::HTTP.get_response(uri)
    body = response.body
    @data = JSON.parse(body)
  end
end
# "data": [
#  {
#  "id": 1,
#  "name": "Bitcoin",
#  "symbol": "BTC",
#  "cmc_rank": 1,
#  "quote": {
#  "USD": {
#  "price": 9356.24564637,
