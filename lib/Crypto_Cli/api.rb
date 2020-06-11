# frozen_string_literal: true

class Crypto::Api
  puts 'Api Loaded '
  attr_reader :data
  # @@data = nil raise error undefined method `[]' for nil:NilClass (NoMethodError)

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
    # response = RestClient.get(URL)
  end
end
# binding.pry
