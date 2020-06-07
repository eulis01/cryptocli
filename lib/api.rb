# frozen_string_literal: true

class Crypto::Ticker
  def data
    @data = []
  end
  KEY = ENV['API_KEY']
  BASE_URL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{KEY}&start=1&limit=15"

  def get_ticker
    response = HTTParty.get(BASE_URL)
    p_data = JSON.parse(response)
    p_data = @@data

    # name = data['name']
    # symbol = data['symbol']
    # rank = data['rank']
    # price = data['price']
    # market_cap_usd = data['market_cap_usd']
    # available_supply = data['available_supply']
    # total_supply = data['total_supply']
    # max_supply = data['max_supply']
    # percent_change_1h = data#['percent_change_1h']
    # percent_change_24h = data#['percent_change_24h']
    # percent_change_7d = data#['percent_change_7d']
    # last_updated = data['last_updated']
    # Ticker.new(data)
    # end
  end

  # binding.pry
end
