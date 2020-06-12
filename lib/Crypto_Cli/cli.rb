# frozen_string_literal: true

class Crypto::CLI
  def call
    Api.get_ticker
    welcome
    top_5_crypto
    get_selection_input
  end

  def welcome
    puts '------------------------------------------------------------------------------'
    puts '------------------------Welcome to the Cryto CLI App--------------------------'
    puts '-------------The data are from https://www.coinmarketcap.com -----------------'
  end

  def top_5_crypto
    puts '-------------------------------------------------------------------------------'
    puts '------------------------Today Top 5 CryptoCurrency-----------------------------'
    puts '-------------------------------------------------------------------------------'
    puts " 1=> #{data.cmc_rank}"
    # puts @ticker['data'][1]
    # puts @ticker['data'][2]
    # puts @ticker['data'][3]
    # puts @ticker['data'][4]
    selection_instructions
    end

  def selection_instructions
    puts 'Type the Y to see top 15 Crypto of the day.'
    puts 'Type N to exit.'
    get_selection_input
  end

  def get_selection_input
    input = gets.strip
    if input.upcase == 'N'
      goodbye
      exit
    elsif input.upcase == 'Y'
      top_15_crypto
      get_selection_input
    elsif valid_input?(input)
      crypto_detail(input)
    end
    detailed_instructions
end

  def detailed_instructions
    puts 'Type N to exit or Y to see Top 15'
    get_detailed_input
  end

  def get_detailed_input
    input = gets.strip
    if input.upcase == 'N'
      goodbye
      exit
    elsif input.upcase == 'Y'
      top_15_crypto
    end
  end

  def valid_input?(input)
    input.upcase == 'Y' || input.upcase == 'N'
  end

  def top_15_crypto
    @ticker.each do |name, cmc_rank|
      puts name
      puts cmc_rank
    end
    # puts @ticker['data'][1..15]
  end

  def currency_format(number)
    !number.nil? ? number.gsub('.00', '').reverse.scan(/(\d*\.\d{1,3}|\d{1,3})/).join(',').reverse.insert(0, '$') : 0
  end

  # binding.pry
  def goodbye
    puts 'Thank you for using Crypto CLI!'
  end
end
