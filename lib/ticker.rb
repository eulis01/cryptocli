
class Crypto::Ticker

	#print 'Ticker Initialized Gathering data'
	@@data = nil

	def initialize
		get_ticker 
	end

	KEY = ENV['API_KEY']
	URL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=#{KEY}&start=1&limit=15&cryptocurrency_type=all"

	def get_ticker

		response = RestClient.get(URL)
		@@data = JSON.parse(response)
		

		
	#binding. pry
	end
	
	def data
		@@data
	end
end
