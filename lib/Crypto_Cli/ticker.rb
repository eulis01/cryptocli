# frozen_string_literal: true

class Crypto::Ticker
  attr_accessor :ticker, :data

  def initialize(_ticker)
    @data.all.each do |d|
      name = d['name']
      cmc_rank = d['cmc_rank']
      symbol = d['symbol']
      price = d['price']
      market_cap = d['market_cap']
      circulating_supply = d['circurlating_supply']

      total_supply = d['total_supply']
      max_supply = d['max_supply']
      percent_change_1h = d['percent_change_1h']
      percent_change_24h = d['percent_change_24h']
      percent_change_7d = d['percent_change_7d']
      last_updated = d['last_updated']
      @data << self
    end
  end
end
