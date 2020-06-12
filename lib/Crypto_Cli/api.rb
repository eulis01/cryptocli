# frozen_string_literal: true

class Api
  KEY = ENV['API_KEY']
  BASE_URL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{KEY}&limit=15&cryptocurrency_type=all"

  def self.get_ticker
    data_url = BASE_URL
    uri = URI(data_url)
    response = Net::HTTP.get_response(uri)
    parsed_data = JSON.parse(response.body)
    parsed_data['data'].each do |ticker|
      cmc_rank = ticker['cmc_rank']
      name = ticker['name']
      symbol = ticker['symbol']
      price = ticker['quote']['USD']['price']
      Ticker.new(cmc_rank, name, symbol, price)
    end
  end
end
