# frozen_string_literal: true

class Crypto::CLI
  attr_reader :ticker, :data

  # binding.pry
  def call
    @ticker = Crypto::Api.new.data
    # @ticker = Crypto::Api.new.data
    welcome
    list_crypto_currencies
    get_selection_input
  end

  # binding.pry
  def welcome
    puts 'Welcome to the Cryto CLI App.'
    puts 'The data are from https://www.coinmarketcap.com and are update every minutes.'
  end

  def list_crypto_currencies
    rows = []
    puts ''
    # ticker.each raise error no implicit convertion of interger into string
    # Ticker.all.each do |ticker|
    @ticker.each do |d|
      one_hour = (d['percent_change_1h'][0] == '-' ? d['percent_change_1h'].red : d['percent_change_1h'].green)
      twenty_four_hour = (d['percent_change_24h'][0] == '-' ? d['percent_change_24h'].red : d['percent_change_24h'].green)
      rows << [d['cmc_rank'], d['symbol'], d['name'], currency_format(d['price']), one_hour + '%', twenty_four_hour + '%']
    end
    table = Terminal::Table.new title: 'Crypto Cli', headings: ['Rank', 'Ticker', 'Name', 'Price', '1 Hr %', '24 Hr %'], rows: rows
    puts table
    puts ''
    selection_instructions
  end

  def selection_instructions
    puts 'Type the number of a Crypto Currency to see its detail.'
    puts 'Type exit to exit.'
    get_selection_input
  end

  def get_selection_input
    input = gets.strip
    if input == 'exit'
      goodbye
      exit
    elsif input == 'l' || input == 'list'
      list_crypto_currencies
      get_selection_input
    elsif valid_input?(input)
      crypto_detail(input)
    end
    detailed_instructions
  end

  def detailed_instructions
    puts 'Type l or list to go back to the main list.'
    puts 'Type exit to exit.'
    get_detailed_input
  end

  def get_detailed_input
    input = gets.chomp
    if input == 'exit'
      goodbye
      exit
    elsif input == 'l' || input == 'list'
      list_crypto_currencies
    end
  end

  def ticker_count
    @ticker.count
  end

  def valid_input?(input)
    input == 'exit' || input == 'l' || input == 'list' || (input.to_i > 0 && input.to_i <= ticker_count) ? true : false
  end

  def crypto_detail(input)
    d = ticker[input.to_i - 1]
    #=> gsub- replaces all instances of a string.
    price = currency_format(d['price'])
    market_cap = currency_format(d['market_cap']).gsub('.0', '')
    circulating_supply = currency_format(d['circulating_supply']).gsub('.0', '')
    max_supply = !d['max_supply'].nil? ? currency_format(d['max_supply']).gsub('.0', '').gsub('$', '') : 'N/A'
    available_percent = max_supply == 'N/A' ? 'N/A' : ((d['volume_24h'].to_f / d['max_supply'].to_f) * 100).round(2)
    volume_24h = currency_format(data['volume_24h']).gsub('.0', '').gsub('$', '')
    one_hour = (d['percent_change_1h'][0] == '-' ? d['percent_change_1h'].red : d['percent_change_1h'].green)
    twenty_four_hour = (d['percent_change_24h'][0] == '-' ? d['percent_change_24h'].red : d['percent_change_24h'].green)
    twenty_four_hour = (d['percent_change_24h'][0] == '-' ? d['percent_change_24h'].red : d['percent_change_24h'].green)
    seven_days = (d['percent_change_7d'][0] == '-' ? d['percent_change_7d'].red : d['percent_change_7d'].green)

    row1 = []
    row1 << [d['symbol'], price, one_hour + '%', twenty_four_hour + '%', seven_days + '%']
    table1 = Terminal::Table.new title: "#{d['name']} Details", headings: ['Symbol', 'Price', '1 Hr %', '24 Hr %', '7 Day %'], rows: row1

    row2 = []
    row2 << d[market_cap, circulating_supply, volume_24h, max_supply, "#{available_percent}%"]
    table2 = Terminal::Table.new title: "#{d['name']} Market Information", headings: ['Market Cap', '24 Hr Volume', 'Avaiable Supply', 'Total Supply', 'Available %'], rows: row2

    puts table1, table2
  end

  def currency_format(number)
    !number.nil? ? number.gsub('.00', '').reverse.scan(/(\d*\.\d{1,3}|\d{1,3})/).join(',').reverse.insert(0, '$') : 0
  end

  # binding.pry
  def goodbye
    puts 'Thank you for using Crypto CLI!'
  end
end
