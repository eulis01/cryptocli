
class Crypto::Ticker
	print 'Ticker Initialized Gathering data'
	@@data = nil

	def initialize
		get_ticker
		#@@data = data
	end

	DATA = "https://pro-api.coinmarketcap.com"
	KEY = ENV['X-CMC_PRO_API_KEY']

	#/&start=1&limit=15	&?limit=15
	def get_ticker
		res = RestClient.get("#{DATA}#{ KEY}/v1/cryptocurrency/quotes/latest")
		data = JSON.parse(res.body)
		data['result'].each do |ticker|
		Crypto.new(ticker['data'])
		end
	end

	def data
		@@data
	end
end
