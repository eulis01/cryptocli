# frozen_string_literal: true

RSpec.describe Crypto do
  it 'has a version number' do
    expect(Crypto::VERSION).not_to be nil
  end

  it 'has a class Api' do
    expect(Api).not_to be nil
  end

  it 'has a class CLI' do
    expect(CLI).not_to be nil
  end

  it 'has a class Ticker' do
    expect(Ticker).not_to be nil
  end

  it 'has a class variable @all' do
    expect(@all) == []
  end
end
