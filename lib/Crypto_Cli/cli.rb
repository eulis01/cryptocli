# frozen_string_literal: true

class CLI
  def call
    @ticker = Api.new.data
    welcome
    top_5_crypto
    get_selection_input
  end

  def welcome
    puts '|==============================================================================|'
    puts '|------------------------Welcome to the Cryto CLI App--------------------------|'
    puts '|-------------The data are from https://www.coinmarketcap.com -----------------|'
  end

  def top_5_crypto
    puts '|==============================================================================|'
    puts '|------------------------Today Top 5 CryptoCurrency----------------------------|'
    puts '|==============================================================================|'
    5.times do |_ticker|
      puts '|================================1=============================================|'
    end
    selection_instructions
    end

  def selection_instructions
    puts 'Type  Y To Get Top 15 Of The Day & Reload Ticker'
    puts 'Type N to Exit'
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
    selection_instructions
end

  def valid_input?(input)
    input.upcase == 'Y' || input.upcase == 'N'
  end

  def top_15_crypto
    puts '|==============================================================================|'
    puts '|------------------------Today Top 15 CryptoCurrency---------------------------|'
    puts '|==============================================================================|'
    15.times do |_ticker|
      puts '|==============================================================================|'
      puts '|------------------------Today Top  CryptoCurrency-----------------------------|'
      puts '|==============================================================================|'
    end
    selection_instructions
  end

  def goodbye
    puts 'Thank You From Crypto CLI!'
  end
end
