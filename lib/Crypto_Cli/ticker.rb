# frozen_string_literal: true

class Ticker
  attr_accessor :name, :cmc_rank, :symbol, :price
  @@all = []

  def initialize(name, cmc_rank, symbol, price)
    @cmc_rank = cmc_rank
    @name = name
    @symbol = symbol
    @price = price
    @@all << self
  end

  def self.all
    @@all
  end
end
