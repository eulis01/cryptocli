# frozen_string_literal: true

class Ticker
  extend Crypto
  attr_reader :data_json, :ticker

  def ticker
    @data_json.all.each do |ticker|
      name = ticker['name']
      cmc_rank = ticker['cmc_rank']
      symbol = ticker['symbol']
      price = ticker['price']
      market_cap = ticker['market_cap']
      circulating_supply = ticker['circurlating_supply']

      total_supply = ticker['total_supply']
      max_supply = ticker['max_supply']
      percent_change_1h = ticker['percent_change_1h']
      percent_change_24h = tcker['percent_change_24h']
      percent_change_7d = ticker['percent_change_7d']
      last_updated = ticker['last_updated']
      Ticker.new(data_json)
    end
  end
end
